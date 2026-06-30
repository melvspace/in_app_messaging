import 'package:in_app_messaging_json_logic/in_app_messaging_json_logic.dart';
import 'package:test/test.dart';

void main() {
  group('JsonLogic edge cases', () {
    test('empty evaluator can be composed with custom operators', () {
      final logic = JsonLogic.empty()
        ..add('literal', (applier, data, params) => params.single);

      expect(logic.apply({'literal': 'value'}, null), 'value');

      logic.remove('literal');
      expect(
        () => logic.apply({'literal': 'value'}, null),
        throwsA(isA<JsonlogicException>()),
      );
    });

    test('default aggregator and quick access removals fail clearly', () {
      final logic = JsonLogic()
        ..remove('_default_aggregator')
        ..remove('_quick_access');

      expect(
        () => logic.apply({
          '==': [1, 1],
          '!=': [1, 2]
        }, null),
        throwsA(isA<JsonlogicException>()),
      );
      expect(
        () => logic.apply({r'$id': '1'}, {'id': '1'}),
        throwsA(isA<JsonlogicException>()),
      );
    });

    test('if, and, and or evaluate lazily', () {
      final logic = JsonLogic()
        ..add('fail', (applier, data, params) {
          throw const JsonlogicException('should not run');
        });

      expect(
        logic.apply({
          'if': [
            false,
            {'fail': []},
            'fallback',
          ],
        }, null),
        'fallback',
      );
      expect(
        logic.apply({
          'and': [
            false,
            {'fail': []},
          ],
        }, null),
        false,
      );
      expect(
        logic.apply({
          'or': [
            true,
            {'fail': []},
          ],
        }, null),
        true,
      );
    });

    test('regex operator matches strings and rejects invalid patterns', () {
      final logic = JsonLogic();

      expect(
        logic.apply({
          'regex': ['release-2026', r'\d{4}$'],
        }, null),
        isTrue,
      );
      expect(
        logic.apply({
          'regex': ['release-2026', '['],
        }, null),
        isFalse,
      );
    });

    test('date.subtract shifts dates backward', () {
      final logic = JsonLogic();

      expect(
        logic.apply({
          'date.subtract': [
            '2026-03-10T00:00:00.000Z',
            5,
            'days',
          ],
        }, null),
        DateTime.utc(2026, 3, 5),
      );
    });

    test('month and year arithmetic clamps overflowing days and preserves UTC',
        () {
      final logic = JsonLogic();

      final monthResult = logic.apply({
        'date.add': [
          '2024-01-31T12:00:00.000Z',
          1,
          'months',
        ],
      }, null);
      final yearResult = logic.apply({
        'date.add': [
          '2024-02-29T12:00:00.000Z',
          12,
          'months',
        ],
      }, null);

      expect(monthResult, DateTime.utc(2024, 2, 29, 12));
      expect(yearResult, DateTime.utc(2025, 2, 28, 12));
      expect((monthResult as DateTime).isUtc, isTrue);
    });

    test('date.truncate supports all documented precisions', () {
      final logic = JsonLogic();
      const date = '2026-06-30T12:34:56.789123';

      expect(
        logic.apply({
          'date.truncate': [date, 'years'],
        }, null),
        DateTime(2026),
      );
      expect(
        logic.apply({
          'date.truncate': [date, 'months'],
        }, null),
        DateTime(2026, 6),
      );
      expect(
        logic.apply({
          'date.truncate': [date, 'days'],
        }, null),
        DateTime(2026, 6, 30),
      );
      expect(
        logic.apply({
          'date.truncate': [date, 'hours'],
        }, null),
        DateTime(2026, 6, 30, 12),
      );
      expect(
        logic.apply({
          'date.truncate': [date, 'minutes'],
        }, null),
        DateTime(2026, 6, 30, 12, 34),
      );
      expect(
        logic.apply({
          'date.truncate': [date, 'seconds'],
        }, null),
        DateTime(2026, 6, 30, 12, 34, 56),
      );
      expect(
        logic.apply({
          'date.truncate': [date, 'milliseconds'],
        }, null),
        DateTime(2026, 6, 30, 12, 34, 56, 789),
      );
    });

    test('date.add rejects invalid intervals and parameter types', () {
      final logic = JsonLogic();

      expect(
        () => logic.apply({
          'date.add': ['2026-01-01T00:00:00', 1, 'fortnights'],
        }, null),
        throwsA(isA<JsonlogicException>()),
      );
      expect(
        () => logic.apply({
          'date.add': ['2026-01-01T00:00:00', '1', 'days'],
        }, null),
        throwsA(isA<JsonlogicException>()),
      );
    });

    test('array and numeric edge cases return stable values', () {
      final logic = JsonLogic();

      expect(
        logic.apply({
          'in': [
            ['a', 'b'],
            [
              ['a', 'b'],
            ],
          ],
        }, null),
        isTrue,
      );
      expect(
        logic.apply({
          '+': [1, 'bad'],
        }, null),
        isNull,
      );
      expect(
        logic.apply({
          'substr': ['jsonlogic', 99],
        }, null),
        '',
      );
    });
  });
}
