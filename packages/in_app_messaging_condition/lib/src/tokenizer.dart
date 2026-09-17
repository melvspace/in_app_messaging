/// The kinds of tokens supported by condition expressions.
enum TokenKind {
  /// A numeric literal represented by an [int] or [double].
  number,

  /// The `true` literal.
  trueLiteral,

  /// The `false` literal.
  falseLiteral,

  /// The `null` literal.
  nullLiteral,

  /// A variable name, which may contain dot-separated path segments.
  identifier,

  /// The `and` logical operator.
  and,

  /// The `or` logical operator.
  or,

  /// The `==` comparison operator.
  equal,

  /// The `!=` comparison operator.
  notEqual,

  /// The `>` comparison operator.
  greaterThan,

  /// The `>=` comparison operator.
  greaterThanOrEqual,

  /// The `<` comparison operator.
  lessThan,

  /// The `<=` comparison operator.
  lessThanOrEqual,

  /// The marker after the final source character.
  endOfInput,
}

/// A lexical token from a condition expression.
final class Token {
  /// Creates a token at [offset] in the original source.
  const Token({
    required this.kind,
    required this.lexeme,
    required this.offset,
    this.value,
  });

  /// The token's syntactic category.
  final TokenKind kind;

  /// The exact source text consumed for this token.
  final String lexeme;

  /// The zero-based source offset at which this token begins.
  final int offset;

  /// The decoded value for literals and identifiers.
  final Object? value;

  @override
  String toString() => 'Token($kind, $lexeme, $offset, $value)';
}

/// Converts [source] into condition-expression tokens.
///
/// Throws a [FormatException] at the first unsupported or malformed character.
List<Token> tokenize(String source) {
  final tokens = <Token>[];
  var offset = 0;

  while (offset < source.length) {
    final character = source.codeUnitAt(offset);
    if (_isWhitespace(character)) {
      offset++;
      continue;
    }

    if (_isDigit(character) ||
        (character == _minus &&
            offset + 1 < source.length &&
            _isDigit(source.codeUnitAt(offset + 1)))) {
      final start = offset;
      if (character == _minus) offset++;

      while (offset < source.length && _isDigit(source.codeUnitAt(offset))) {
        offset++;
      }

      var isDecimal = false;
      if (offset < source.length && source.codeUnitAt(offset) == _dot) {
        if (offset + 1 >= source.length ||
            !_isDigit(source.codeUnitAt(offset + 1))) {
          throw FormatException(
            'Expected a digit after the decimal point',
            source,
            offset,
          );
        }
        isDecimal = true;
        offset++;
        while (offset < source.length && _isDigit(source.codeUnitAt(offset))) {
          offset++;
        }
      }

      final lexeme = source.substring(start, offset);
      tokens.add(
        Token(
          kind: TokenKind.number,
          lexeme: lexeme,
          offset: start,
          value: isDecimal ? double.parse(lexeme) : int.parse(lexeme),
        ),
      );
      continue;
    }

    if (_isIdentifierStart(character)) {
      final start = offset;
      offset = _consumeIdentifierSegment(source, offset);
      while (offset < source.length && source.codeUnitAt(offset) == _dot) {
        final dotOffset = offset;
        offset++;
        if (offset >= source.length ||
            !_isIdentifierStart(source.codeUnitAt(offset))) {
          throw FormatException(
            'Expected an identifier after the dot',
            source,
            dotOffset,
          );
        }
        offset = _consumeIdentifierSegment(source, offset);
      }

      final lexeme = source.substring(start, offset);
      final (kind, value) = switch (lexeme) {
        'true' => (TokenKind.trueLiteral, true),
        'false' => (TokenKind.falseLiteral, false),
        'null' => (TokenKind.nullLiteral, null),
        'and' => (TokenKind.and, null),
        'or' => (TokenKind.or, null),
        _ => (TokenKind.identifier, lexeme),
      };
      tokens.add(
        Token(kind: kind, lexeme: lexeme, offset: start, value: value),
      );
      continue;
    }

    final start = offset;
    TokenKind? kind;
    switch (character) {
      case _equals:
        if (_hasFollowing(source, offset, _equals)) {
          kind = TokenKind.equal;
          offset += 2;
        }
      case _exclamation:
        if (_hasFollowing(source, offset, _equals)) {
          kind = TokenKind.notEqual;
          offset += 2;
        }
      case _greaterThan:
        if (_hasFollowing(source, offset, _equals)) {
          kind = TokenKind.greaterThanOrEqual;
          offset += 2;
        } else {
          kind = TokenKind.greaterThan;
          offset++;
        }
      case _lessThan:
        if (_hasFollowing(source, offset, _equals)) {
          kind = TokenKind.lessThanOrEqual;
          offset += 2;
        } else {
          kind = TokenKind.lessThan;
          offset++;
        }
    }

    if (kind == null) {
      throw FormatException(
        'Unexpected character ${source[start]}',
        source,
        start,
      );
    }
    tokens.add(
      Token(kind: kind, lexeme: source.substring(start, offset), offset: start),
    );
  }

  tokens.add(
    Token(kind: TokenKind.endOfInput, lexeme: '', offset: source.length),
  );
  return tokens;
}

int _consumeIdentifierSegment(String source, int offset) {
  offset++;
  while (offset < source.length &&
      _isIdentifierPart(source.codeUnitAt(offset))) {
    offset++;
  }
  return offset;
}

bool _hasFollowing(String source, int offset, int character) =>
    offset + 1 < source.length && source.codeUnitAt(offset + 1) == character;

bool _isWhitespace(int character) => switch (character) {
  0x09 || 0x0A || 0x0B || 0x0C || 0x0D || 0x20 => true,
  _ => false,
};

bool _isDigit(int character) => character >= 0x30 && character <= 0x39;

bool _isIdentifierStart(int character) =>
    character == _underscore ||
    (character >= 0x41 && character <= 0x5A) ||
    (character >= 0x61 && character <= 0x7A);

bool _isIdentifierPart(int character) =>
    _isIdentifierStart(character) || _isDigit(character);

const _exclamation = 0x21;
const _dot = 0x2E;
const _minus = 0x2D;
const _lessThan = 0x3C;
const _equals = 0x3D;
const _greaterThan = 0x3E;
const _underscore = 0x5F;
