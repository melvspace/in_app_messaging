import 'package:in_app_messaging/in_app_messaging.dart';
import 'package:in_app_messaging/src/core/typedefs.dart';
import 'package:in_app_messaging_json_logic/in_app_messaging_json_logic.dart';
import 'package:test/test.dart';

class _TestCase {
  final String name;
  final JsonMap condition;
  final JsonMap data;
  final bool expected;

  _TestCase(this.name, this.condition, this.data, this.expected);
}

const never = null;
final today = DateTime.now();
final yesterday = today.subtract(const Duration(days: 1));

final cases = [
  // Once per day
  _TestCase(
    'once per day - never seen',
    OncePerDayCondition().asJsonLogic(),
    {
      'interactions': {'last_seen': never}
    },
    true,
  ),
  _TestCase(
    'once per day - seen today',
    OncePerDayCondition().asJsonLogic(),
    {
      'interactions': {'last_seen': today}
    },
    false,
  ),
  _TestCase(
    'once per day - seen yesterday',
    OncePerDayCondition().asJsonLogic(),
    {
      'interactions': {'last_seen': yesterday}
    },
    true,
  ),

  // Once per time
  _TestCase(
    'once per hour - never seen',
    OncePerTimeCondition(duration: const Duration(hours: 1)).asJsonLogic(),
    {
      'interactions': {'last_seen': never}
    },
    true,
  ),
  _TestCase(
    'once per hour - seen 55 minutes ago',
    OncePerTimeCondition(duration: const Duration(hours: 1)).asJsonLogic(),
    {
      'interactions': {'last_seen': today.subtract(const Duration(minutes: 55))}
    },
    false,
  ),
  _TestCase(
    'once per hour - seen 2 hours ago',
    OncePerTimeCondition(duration: const Duration(hours: 1)).asJsonLogic(),
    {
      'interactions': {'last_seen': today.subtract(const Duration(hours: 2))}
    },
    true,
  ),
  _TestCase(
    'once per hour - seen 2 hours in future',
    OncePerTimeCondition(duration: const Duration(hours: 1)).asJsonLogic(),
    {
      'interactions': {'last_seen': today.add(const Duration(hours: 2))}
    },
    false,
  ),

  // Once condition
  _TestCase(
    'once - never seen',
    OnceCondition().asJsonLogic(),
    {'interactions': {}},
    true,
  ),
  _TestCase(
    'once - seen',
    OnceCondition().asJsonLogic(),
    {
      'interactions': {'last_seen': yesterday}
    },
    false,
  ),
  _TestCase(
    'once - seen in far future',
    OnceCondition().asJsonLogic(),
    {
      'interactions': {'last_seen': today.add(const Duration(days: 1000))}
    },
    false,
  ),

  // Once per trigger properties condition
  _TestCase(
    'once per trigger properties - never seen',
    OncePerEventPropertiesCondition(properties: {'id', 'name'}).asJsonLogic(),
    {
      'event': {'id': '1', 'name': 'John'},
      'interactions': {'last_seen': never, 'seen_entries': []}
    },
    true,
  ),
  _TestCase(
    'once per trigger properties - seen with other trigger properties',
    OncePerEventPropertiesCondition(properties: {'id', 'name'}).asJsonLogic(),
    {
      'event': {'id': '1', 'name': 'John'},
      'interactions': {
        'last_seen': yesterday,
        'seen_entries': [
          {
            'date': yesterday,
            'trigger_properties': {'id': '2', 'name': 'Jane'}
          }
        ]
      }
    },
    true,
  ),
  _TestCase(
    'once per trigger properties - seen with same trigger properties',
    OncePerEventPropertiesCondition(properties: {'id', 'name'}).asJsonLogic(),
    {
      'event': {'id': '1', 'name': 'John'},
      'interactions': {
        'last_seen': yesterday,
        'seen_entries': [
          {
            'date': yesterday,
            'trigger_properties': {'id': '1', 'name': 'John'}
          }
        ]
      }
    },
    false,
  ),
];

void main() {
  final jl = JsonLogic();

  for (final tCase in cases) {
    test('${tCase.name}, expected: ${tCase.expected}', () {
      final result = jl.apply(tCase.condition, tCase.data);
      expect(result, tCase.expected);
    });
  }
}
