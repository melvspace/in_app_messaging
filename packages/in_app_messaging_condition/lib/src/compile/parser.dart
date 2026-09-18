import 'package:in_app_messaging_condition/src/compile/tokenizer.dart';
import 'package:in_app_messaging_condition/src/runtime/condition_context.dart';

typedef _Expression = Object? Function(ConditionContext context);

/// Parses [source] into an expression that can be evaluated against a context.
Object? Function(ConditionContext context) parse(String source) {
  return _Parser(source, tokenize(source)).parse();
}

final class _Parser {
  _Parser(this.source, this.tokens);

  final String source;
  final List<Token> tokens;
  var _current = 0;

  _Expression parse() {
    if (_check(TokenKind.endOfInput)) {
      throw FormatException('Expected an expression', source, 0);
    }
    final expression = _parseOr();
    _consume(TokenKind.endOfInput, 'Unexpected trailing token');
    return expression;
  }

  _Expression _parseOr() {
    var expression = _parseAnd();
    while (_match(TokenKind.or)) {
      final left = expression;
      final right = _parseAnd();
      expression = (context) => _isTruthy(left(context)) || _isTruthy(right(context));
    }
    return expression;
  }

  _Expression _parseAnd() {
    var expression = _parseNot();
    while (_match(TokenKind.and)) {
      final left = expression;
      final right = _parseNot();
      expression = (context) => _isTruthy(left(context)) && _isTruthy(right(context));
    }
    return expression;
  }

  _Expression _parseNot() {
    var negated = false;
    while (_match(TokenKind.not)) {
      negated = !negated;
    }
    final expression = _parseComparison();
    return negated ? (context) => !_isTruthy(expression(context)) : expression;
  }

  _Expression _parseComparison() {
    final left = _parseFallback();
    var negated = false;
    Token? operator;

    if (_check(TokenKind.not) && _isMembership(_peekNext.kind)) {
      _advance();
      negated = true;
      operator = _advance();
    } else if (_isComparison(_peek.kind)) {
      operator = _advance();
    }

    if (operator == null) return left;
    final right = _parseFallback();
    final comparison = operator;
    return (context) {
      final result = _compare(
        comparison.kind,
        left(context),
        right(context),
        context,
        source,
        comparison.offset,
      );
      return negated ? !result : result;
    };
  }

  _Expression _parseFallback() {
    var expression = _parseAdditive();
    while (_match(TokenKind.nullFallback)) {
      final left = expression;
      final right = _parseAdditive();
      expression = (context) => left(context) ?? right(context);
    }
    return expression;
  }

  _Expression _parseAdditive() {
    var expression = _parseMultiplicative();
    while (_matchAny(const [TokenKind.plus, TokenKind.minus])) {
      final operator = _previous.kind;
      final left = expression;
      final right = _parseMultiplicative();
      expression = (context) => _arithmetic(operator, left(context), right(context), context);
    }
    return expression;
  }

  _Expression _parseMultiplicative() {
    var expression = _parseUnary();
    while (_matchAny(const [TokenKind.multiply, TokenKind.divide, TokenKind.remainder])) {
      final operator = _previous.kind;
      final left = expression;
      final right = _parseUnary();
      expression = (context) => _arithmetic(operator, left(context), right(context), context);
    }
    return expression;
  }

  _Expression _parseUnary() {
    if (!_matchAny(const [TokenKind.plus, TokenKind.minus])) return _parsePrimary();

    final operator = _previous.kind;
    final operand = _parsePrimary();
    return (context) => _unary(operator, operand(context), context);
  }

  _Expression _parsePrimary() {
    if (_matchAny(const [
      TokenKind.number,
      TokenKind.string,
      TokenKind.trueLiteral,
      TokenKind.falseLiteral,
      TokenKind.nullLiteral,
    ])) {
      final value = _previous.value;
      return (_) => value;
    }

    if (_match(TokenKind.leftParenthesis)) {
      final expression = _parseOr();
      _consume(TokenKind.rightParenthesis, 'Expected a closing parenthesis');
      return expression;
    }

    if (_match(TokenKind.identifier)) {
      return _parseIdentifier(_previous);
    }

    throw FormatException('Expected an expression', source, _peek.offset);
  }

  _Expression _parseIdentifier(Token identifier) {
    final segments = <Object>[...(identifier.value! as String).split('.')];

    while (true) {
      if (_match(TokenKind.leftBracket)) {
        if (!_matchAny(const [TokenKind.number, TokenKind.string])) {
          throw FormatException('Expected an integer or string access key', source, _peek.offset);
        }
        final keyToken = _previous;
        if (keyToken.value is double) {
          throw FormatException('List indices must be integers', source, keyToken.offset);
        }
        segments.add(keyToken.value!);
        _consume(TokenKind.rightBracket, 'Expected a closing bracket');
        continue;
      }

      if (_match(TokenKind.dot)) {
        final suffix = _consume(TokenKind.identifier, 'Expected an identifier after the dot');
        segments.addAll((suffix.value! as String).split('.'));
        continue;
      }
      break;
    }

    if (!_match(TokenKind.leftParenthesis)) {
      return (context) => _readPath(context.values, segments, context);
    }

    final functionName = segments.removeLast() as String;
    final arguments = _parseArguments();
    if (segments.isEmpty) {
      return (context) {
        final function = context.resolveFunction(functionName);
        if (function == null) {
          throw FormatException('Unknown function $functionName', source, identifier.offset);
        }
        return function([for (final argument in arguments) argument(context)]);
      };
    }

    return (context) {
      final receiver = _readPath(context.values, segments, context);
      final object = receiver == null ? null : context.toConditionObject(receiver);
      final function = object?.resolveFunction(functionName);
      if (function == null) {
        throw FormatException('Unknown instance function $functionName', source, identifier.offset);
      }
      return function([for (final argument in arguments) argument(context)]);
    };
  }

  List<_Expression> _parseArguments() {
    final arguments = <_Expression>[];
    if (!_check(TokenKind.rightParenthesis)) {
      do {
        arguments.add(_parseOr());
      } while (_match(TokenKind.comma));
    }
    _consume(TokenKind.rightParenthesis, 'Expected a closing parenthesis');
    return arguments;
  }

  bool _match(TokenKind kind) {
    if (!_check(kind)) return false;
    _advance();
    return true;
  }

  bool _matchAny(List<TokenKind> kinds) {
    for (final kind in kinds) {
      if (_match(kind)) return true;
    }
    return false;
  }

  Token _consume(TokenKind kind, String message) {
    if (_check(kind)) return _advance();
    throw FormatException(message, source, _peek.offset);
  }

  bool _check(TokenKind kind) => _peek.kind == kind;

  Token _advance() {
    if (!_check(TokenKind.endOfInput)) _current++;
    return _previous;
  }

  Token get _peek => tokens[_current];

  Token get _peekNext => tokens[_current + 1];

  Token get _previous => tokens[_current - 1];
}

bool _isComparison(TokenKind kind) => switch (kind) {
  TokenKind.equal ||
  TokenKind.notEqual ||
  TokenKind.greaterThan ||
  TokenKind.greaterThanOrEqual ||
  TokenKind.lessThan ||
  TokenKind.lessThanOrEqual ||
  TokenKind.contains ||
  TokenKind.inOperator ||
  TokenKind.matches => true,
  _ => false,
};

bool _isMembership(TokenKind kind) => switch (kind) {
  TokenKind.contains || TokenKind.inOperator || TokenKind.matches => true,
  _ => false,
};

bool _isTruthy(Object? value) => switch (value) {
  null => false,
  false => false,
  final num number => number != 0,
  final String string => string.isNotEmpty,
  final List<Object?> list => list.isNotEmpty,
  final Set<Object?> set => set.isNotEmpty,
  final Map<Object?, Object?> map => map.isNotEmpty,
  _ => true,
};

Object? _readPath(Object? root, List<Object> segments, ConditionContext context) {
  Object? value = root;
  for (final segment in segments) {
    if (value is Map<Object?, Object?>) {
      value = value[segment];
      continue;
    }
    if (segment is int && value is List<Object?>) {
      value = segment >= 0 && segment < value.length ? value[segment] : null;
      continue;
    }
    if (value == null) return null;

    final object = context.toConditionObject(value);
    if (object == null) return null;
    try {
      value = switch (segment) {
        final String key => object.accessKey(key),
        final int index => object.accessIndex(index),
        _ => null,
      };
    } on RangeError {
      value = null;
    } on TypeError {
      value = null;
    }
  }
  return value;
}

bool _compare(
  TokenKind operator,
  Object? left,
  Object? right,
  ConditionContext context,
  String source,
  int offset,
) {
  return switch (operator) {
    TokenKind.equal => _equals(left, right, context),
    TokenKind.notEqual => !_equals(left, right, context),
    TokenKind.greaterThan => _ordered(left, right, context, greater: true),
    TokenKind.greaterThanOrEqual => _ordered(left, right, context, greater: true) || _equals(left, right, context),
    TokenKind.lessThan => _ordered(left, right, context, greater: false),
    TokenKind.lessThanOrEqual => _ordered(left, right, context, greater: false) || _equals(left, right, context),
    TokenKind.contains => _contains(left, right),
    TokenKind.inOperator => _contains(right, left),
    TokenKind.matches => _matches(left, right, source, offset),
    _ => false,
  };
}

bool _equals(Object? left, Object? right, ConditionContext context) {
  if (left == null || right == null) return left == right;
  if (left is num && right is num) return left == right;
  if (left is bool || right is bool) return left is bool && right is bool && left == right;
  if (left is String || right is String) return left is String && right is String && left == right;

  final object = context.toConditionObject(left);
  if (object == null) return left == right;
  try {
    return object.equals(right);
  } on TypeError {
    return false;
  }
}

bool _ordered(Object? left, Object? right, ConditionContext context, {required bool greater}) {
  if (left is num && right is num) return greater ? left > right : left < right;
  if (left == null || right == null) return false;

  final object = context.toConditionObject(left);
  if (object == null) return false;
  try {
    return greater ? object.greater(right) : object.less(right);
  } on TypeError {
    return false;
  }
}

bool _contains(Object? container, Object? value) => switch (container) {
  final String string when value is String => string.contains(value),
  final List<Object?> list => list.contains(value),
  final Set<Object?> set => set.contains(value),
  final Map<Object?, Object?> map => map.containsKey(value),
  _ => false,
};

bool _matches(Object? value, Object? pattern, String source, int offset) {
  if (value is! String || pattern is! String) return false;
  try {
    return RegExp(pattern).hasMatch(value);
  } on FormatException catch (error) {
    throw FormatException('Invalid regular expression: ${error.message}', source, offset);
  }
}

Object? _arithmetic(TokenKind operator, Object? left, Object? right, ConditionContext context) {
  if (left is num && right is num) {
    return switch (operator) {
      TokenKind.plus => left + right,
      TokenKind.minus => left - right,
      TokenKind.multiply => left * right,
      TokenKind.divide => right == 0 ? null : left / right,
      TokenKind.remainder => right == 0 ? null : left % right,
      _ => null,
    };
  }
  if (left == null || right == null) return null;

  final object = context.toConditionObject(left);
  if (object == null) return null;
  try {
    return switch (operator) {
      TokenKind.plus => object.add(right),
      TokenKind.minus => object.subtract(right),
      TokenKind.multiply => object.multiply(right),
      TokenKind.divide => right == 0 ? null : object.divide(right),
      TokenKind.remainder => right == 0 ? null : object.remainder(right),
      _ => null,
    };
  } on TypeError {
    return null;
  }
}

Object? _unary(TokenKind operator, Object? value, ConditionContext context) {
  if (value is num) return operator == TokenKind.plus ? value : -value;
  if (value == null) return null;

  final object = context.toConditionObject(value);
  if (object == null) return null;
  return operator == TokenKind.plus ? object.positive() : object.negate();
}

/// Converts an expression value to its condition result.
bool toConditionResult(Object? value) => _isTruthy(value);
