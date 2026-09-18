import 'package:in_app_messaging_condition/in_app_messaging_condition.dart';
import 'package:test/test.dart';

void main() {
  group('evaluation', () {
    test('reads mixed bracket and dot paths', () {
      final context = ConditionContext(
        values: {
          'items': [
            {'enabled': true},
          ],
          'labels': {1: true},
        },
      );

      expect(eval('items[0].enabled', context), isTrue);
      expect(eval('labels[1]', context), isTrue);
    });

    test('applies arithmetic precedence from left to right', () {
      expect(eval('1 + 2 * 3 == 7'), isTrue);
      expect(eval('8 / 2 * 2 == 8'), isTrue);
      expect(eval('8 - 3 - 2 == 3'), isTrue);
    });

    test('short-circuits boolean and fallback operators', () {
      Object? fail(List<Object?> _) => throw StateError('must not be called');
      final context = ConditionContext(functions: {'fail': fail});

      expect(eval('false and fail()', context), isFalse);
      expect(eval('true or fail()', context), isTrue);
      expect(eval('true ?? fail()', context), isTrue);
    });

    test('returns null semantics for unsupported arithmetic and zero division', () {
      expect(eval('"one" + 1'), isFalse);
      expect(eval('1 / 0'), isFalse);
      expect(eval('1 % 0'), isFalse);
    });
  });

  group('authoring errors', () {
    for (final condition in [
      '',
      'true false',
      '(true',
      'items[',
      '1 < 2 < 3',
      'unknown()',
      '"value" matches "["',
    ]) {
      test('rejects `$condition`', () {
        expect(() => eval(condition), throwsFormatException);
      });
    }
  });
}
