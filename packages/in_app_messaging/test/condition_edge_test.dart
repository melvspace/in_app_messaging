import 'package:in_app_messaging/in_app_messaging.dart';
import 'package:in_app_messaging_json_logic/in_app_messaging_json_logic.dart';
import 'package:test/test.dart';

void main() {
  group('ComparisonType', () {
    test('compares exact, substring, regex, version, number, and string values',
        () {
      expect(ComparisonType.exactlyMatches.compare('pro', 'pro'), isTrue);
      expect(ComparisonType.contains.compare('pro-user', 'pro'), isTrue);
      expect(
        ComparisonType.doesNotContains.compare('free-user', 'pro'),
        isTrue,
      );
      expect(
        ComparisonType.containsRegex.compare('release-2026', r'\d{4}$'),
        isTrue,
      );
      expect(ComparisonType.greater.compare('2.0.0', '1.0.0'), isTrue);
      expect(ComparisonType.greaterOrEquals.compare('2', '2'), isTrue);
      expect(ComparisonType.less.compare('1', '2'), isTrue);
      expect(ComparisonType.lessOrEquals.compare('a', 'b'), isFalse);
      expect(ComparisonType.equals.compare('42', '42'), isTrue);
      expect(ComparisonType.notEquals.compare('free', 'pro'), isTrue);
    });

    test('invalid regex comparison returns false', () {
      expect(ComparisonType.containsRegex.compare('value', '['), isFalse);
    });
  });

  group('MessageCondition composition', () {
    test('& and | ignore null right side', () {
      final condition = OnceCondition();

      expect(condition & null, same(condition));
      expect(condition | null, same(condition));
    });

    test('property condition builders emit executable JsonLogic', () {
      final logic = JsonLogic();
      final data = {
        'user': {
          'plan': 'pro-user',
          'release': 'release-2026',
        },
        'device': {
          'language': 'en-US',
        },
      };

      final cases = {
        'contains': UserPropertyCondition(
          key: 'plan',
          type: ComparisonType.contains,
          value: 'pro',
        ).asJsonLogic(),
        'does not contain': UserPropertyCondition(
          key: 'plan',
          type: ComparisonType.doesNotContains,
          value: 'enterprise',
        ).asJsonLogic(),
        'regex': UserPropertyCondition(
          key: 'release',
          type: ComparisonType.containsRegex,
          value: r'\d{4}$',
        ).asJsonLogic(),
        'device contains': DevicePropertyCondition(
          key: 'language',
          type: ComparisonType.contains,
          value: 'en',
        ).asJsonLogic(),
      };

      for (final entry in cases.entries) {
        expect(
          logic.apply(entry.value, data),
          isTrue,
          reason: entry.key,
        );
      }
    });
  });
}
