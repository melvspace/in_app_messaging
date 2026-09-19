import 'package:in_app_messaging_condition/in_app_messaging_condition.dart';
import 'package:test/test.dart';

void main() {
  group('plain objects', () {
    final cases = [
      ("1", true),
      ("true", true),
      ("false", false),
      ("0", false),
      ("null", false),
      ("-1", true),
      ('"hello"', true),
      ('""', false),
    ];

    for (final (fixture, expected) in cases) {
      test("$fixture is $expected", () {
        final result = eval(fixture);
        expect(result, equals(expected));
      });
    }
  });

  group("binary operators", () {
    final cases = [
      ("true and false", false),
      ("true or false", true),
      ("1 and false", false),
      ("1 or false", true),
      ("false and 1", false),
      ("false or 1", true),
      ("false and 0", false),
      ("false or 0", false),
      ("true and null", false),
      ("true or null", true),
      ("true and -1", true),
      ("true or -1", true),
      ("true and 0", false),
      ("true or 0", true),
      ("true or false and false", true),
      ("(true or false) and false", false),
      ("not true", false),
      ("not false", true),
      ("not (true and false)", true),
      ('"hello" or false', true),
      ('"hello" and true', true),
    ];

    for (final (fixture, expected) in cases) {
      test("$fixture is $expected", () {
        final result = eval(fixture);
        expect(result, equals(expected));
      });
    }
  });

  group("comparison operators", () {
    final cases = [
      ("1 == 1", true),
      ("1 == 3", false),
      ("true == true", true),
      ("true == false", false),
      ("true != true", false),
      ("true != false", true),
      ("1 > 0", true),
      ("1.5 > 0", true),
      ("1.5 < 0", false),
      ("1.5 >= 1.5", true),
      ("1.5 <= 1.5", true),
      ("1.5 <= 0", false),
      ('1 == "1"', false),
    ];
    for (final (fixture, expected) in cases) {
      test("$fixture is $expected", () {
        final result = eval(fixture);
        expect(result, equals(expected));
      });
    }
  });

  group("null fallback operator", () {
    final cases = [
      ("missing ?? true", <String, Object?>{}, true),
      ("value ?? true", <String, Object?>{"value": false}, false),
      ("value ?? true", <String, Object?>{"value": 0}, false),
      ("value ?? true", <String, Object?>{"value": ""}, false),
      ("value ?? false", <String, Object?>{"value": true}, true),
      (
        "first ?? second ?? false",
        <String, Object?>{"second": true},
        true,
      ),
      ("missing ?? 1 + 2 == 3", <String, Object?>{}, true),
    ];

    for (final (fixture, context, expected) in cases) {
      test("$fixture is $expected", () {
        final result = eval(fixture, ConditionContext(values: context));
        expect(result, equals(expected));
      });
    }
  });

  group("string and membership operators", () {
    final cases = [
      (
        'user.plan contains "pro"',
        {
          "user": {"plan": "professional"},
        },
        true,
      ),
      (
        'user.plan contains "free"',
        {
          "user": {"plan": "professional"},
        },
        false,
      ),
      (
        'user.plan not contains "free"',
        {
          "user": {"plan": "professional"},
        },
        true,
      ),
      (
        'user.plan not contains "pro"',
        {
          "user": {"plan": "professional"},
        },
        false,
      ),
      (
        '"premium" in user.tags',
        {
          "user": {
            "tags": ["premium", "beta"],
          },
        },
        true,
      ),
      (
        '"free" in user.tags',
        {
          "user": {
            "tags": ["premium", "beta"],
          },
        },
        false,
      ),
      (
        '"free" not in user.tags',
        {
          "user": {
            "tags": ["premium", "beta"],
          },
        },
        true,
      ),
      (
        '"premium" not in user.tags',
        {
          "user": {
            "tags": ["premium", "beta"],
          },
        },
        false,
      ),
      (
        'user.release matches "^release-[0-9]{4}\$"',
        {
          "user": {"release": "release-2026"},
        },
        true,
      ),
      (
        'user.release not matches "^release-[0-9]{4}\$"',
        {
          "user": {"release": "release-2026"},
        },
        false,
      ),
      (
        'user.release not matches "-snapshot\$"',
        {
          "user": {"release": "release-2026"},
        },
        true,
      ),
    ];

    for (final (fixture, context, expected) in cases) {
      test("$fixture is $expected", () {
        final result = eval(fixture, ConditionContext(values: context));
        expect(result, equals(expected));
      });
    }
  });

  group("variables access", () {
    final cases = [
      ("now > 0", {"now": 100}, true),
      (
        "object.object.field > 0",
        {
          "object": {
            "object": {"field": 100},
          },
        },
        true,
      ),
      (
        "object.object.field",
        {
          "object": {
            "object": {"field": true},
          },
        },
        true,
      ),
      (
        "interactions.seen_entries[0]",
        {
          "interactions": {
            "seen_entries": [true],
          },
        },
        true,
      ),
      (
        'event["product.name"]',
        {
          "event": {"product.name": true},
        },
        true,
      ),
      (
        'event["order-id"]',
        {
          "event": {"order-id": true},
        },
        true,
      ),
      ("missing", <String, Object?>{}, false),
      ("value", <String, Object?>{"value": null}, false),
      ("value", <String, Object?>{"value": ""}, false),
      ("value", <String, Object?>{"value": "hello"}, true),
      ("value", <String, Object?>{"value": <Object?>[]}, false),
      (
        "value",
        <String, Object?>{
          "value": [1],
        },
        true,
      ),
      ("value", <String, Object?>{"value": <String, Object?>{}}, false),
      (
        "value",
        <String, Object?>{
          "value": {"enabled": false},
        },
        true,
      ),
    ];

    for (final (fixture, context, expected) in cases) {
      test("$fixture is $expected", () {
        final result = eval(fixture, ConditionContext(values: context));
        expect(result, equals(expected));
      });
    }
  });
}
