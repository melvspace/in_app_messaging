import 'package:in_app_messaging_condition/src/compile/tokenizer.dart';
import 'package:test/test.dart';

void main() {
  group('tokenize', () {
    test('tokenizes literals, operators, and variable paths', () {
      const source = 'true and false or null == object.child_1 >= -1.5';
      final tokens = tokenize(source);

      expect(
        tokens.map((token) => token.kind),
        equals([
          TokenKind.trueLiteral,
          TokenKind.and,
          TokenKind.falseLiteral,
          TokenKind.or,
          TokenKind.nullLiteral,
          TokenKind.equal,
          TokenKind.identifier,
          TokenKind.greaterThanOrEqual,
          TokenKind.minus,
          TokenKind.number,
          TokenKind.endOfInput,
        ]),
      );
      expect(tokens[6].value, equals('object.child_1'));
      expect(tokens[9].value, equals(1.5));
      expect(tokens.last.offset, equals(source.length));
    });

    test('preserves integer and decimal values', () {
      final tokens = tokenize('0 1 1.5');

      expect(tokens[0].value, equals(0));
      expect(tokens[0].value, isA<int>());
      expect(tokens[1].value, equals(1));
      expect(tokens[1].value, isA<int>());
      expect(tokens[2].value, equals(1.5));
      expect(tokens[2].value, isA<double>());
    });

    test('decodes strings and tokenizes bracket access', () {
      final tokens = tokenize(r'''event["line\n\"quoted\""][0].enabled''');

      expect(
        tokens.map((token) => token.kind),
        equals([
          TokenKind.identifier,
          TokenKind.leftBracket,
          TokenKind.string,
          TokenKind.rightBracket,
          TokenKind.leftBracket,
          TokenKind.number,
          TokenKind.rightBracket,
          TokenKind.dot,
          TokenKind.identifier,
          TokenKind.endOfInput,
        ]),
      );
      expect(tokens[2].value, 'line\n"quoted"');
    });

    test('tokenizes arithmetic operators', () {
      final tokens = tokenize('+ - * / %');

      expect(
        tokens.map((token) => token.kind),
        equals([
          TokenKind.plus,
          TokenKind.minus,
          TokenKind.multiply,
          TokenKind.divide,
          TokenKind.remainder,
          TokenKind.endOfInput,
        ]),
      );
    });

    test('tokenizes the null-fallback operator', () {
      final tokens = tokenize('primary??fallback');

      expect(
        tokens.map((token) => token.kind),
        equals([
          TokenKind.identifier,
          TokenKind.nullFallback,
          TokenKind.identifier,
          TokenKind.endOfInput,
        ]),
      );
    });

    test('distinguishes subtraction from numeric literals', () {
      final tokens = tokenize('-1+2-3*4/5%6');

      expect(
        tokens.map((token) => token.kind),
        equals([
          TokenKind.minus,
          TokenKind.number,
          TokenKind.plus,
          TokenKind.number,
          TokenKind.minus,
          TokenKind.number,
          TokenKind.multiply,
          TokenKind.number,
          TokenKind.divide,
          TokenKind.number,
          TokenKind.remainder,
          TokenKind.number,
          TokenKind.endOfInput,
        ]),
      );
    });

    test('uses maximal matching for comparison operators', () {
      final tokens = tokenize('== != > >= < <=');

      expect(
        tokens.map((token) => token.kind),
        equals([
          TokenKind.equal,
          TokenKind.notEqual,
          TokenKind.greaterThan,
          TokenKind.greaterThanOrEqual,
          TokenKind.lessThan,
          TokenKind.lessThanOrEqual,
          TokenKind.endOfInput,
        ]),
      );
    });

    test('does not match keywords inside identifiers', () {
      final tokens = tokenize(
        'android order nullable true_value notable inbox containsAll matches_value',
      );

      expect(
        tokens.take(8).map((token) => token.kind),
        everyElement(TokenKind.identifier),
      );
    });

    test('tokenizes logical and membership keywords', () {
      final tokens = tokenize('not contains not in not matches');

      expect(
        tokens.map((token) => token.kind),
        equals([
          TokenKind.not,
          TokenKind.contains,
          TokenKind.not,
          TokenKind.inOperator,
          TokenKind.not,
          TokenKind.matches,
          TokenKind.endOfInput,
        ]),
      );
    });

    test('tokenizes function calls and arguments', () {
      final tokens = tokenize('isEligible(user.plan, 10)');

      expect(
        tokens.map((token) => token.kind),
        equals([
          TokenKind.identifier,
          TokenKind.leftParenthesis,
          TokenKind.identifier,
          TokenKind.comma,
          TokenKind.number,
          TokenKind.rightParenthesis,
          TokenKind.endOfInput,
        ]),
      );
      expect(tokens.first.value, 'isEligible');
    });

    test('tokenizes instance function calls', () {
      final tokens = tokenize('audience.isEligible(user.plan)');

      expect(
        tokens.map((token) => token.kind),
        equals([
          TokenKind.identifier,
          TokenKind.leftParenthesis,
          TokenKind.identifier,
          TokenKind.rightParenthesis,
          TokenKind.endOfInput,
        ]),
      );
      expect(tokens.first.value, 'audience.isEligible');
    });

    test('ignores whitespace and records source offsets', () {
      final tokens = tokenize('\t now\n<=\r 10 ');

      expect(tokens.map((token) => token.offset), equals([2, 6, 10, 13]));
      expect(
        tokens.map((token) => token.lexeme),
        equals(['now', '<=', '10', '']),
      );
    });

    test('tokenizes operators without surrounding whitespace', () {
      final tokens = tokenize('value>=0');

      expect(
        tokens.map((token) => token.kind),
        equals([
          TokenKind.identifier,
          TokenKind.greaterThanOrEqual,
          TokenKind.number,
          TokenKind.endOfInput,
        ]),
      );
    });

    test('returns only end of input for empty source', () {
      final tokens = tokenize('');

      expect(tokens, hasLength(1));
      expect(tokens.single.kind, TokenKind.endOfInput);
      expect(tokens.single.offset, 0);
    });

    for (final source in [
      '=',
      '!',
      '?',
      '@',
      '.field',
      'field.',
      'field..name',
      '1.',
      '1.2.3',
      '"unterminated',
      r'"invalid\escape"',
    ]) {
      test('rejects malformed input: $source', () {
        expect(() => tokenize(source), throwsFormatException);
      });
    }
  });
}
