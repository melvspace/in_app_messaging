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
    ];
    for (final (fixture, expected) in cases) {
      test("$fixture is $expected", () {
        final result = eval(fixture, {});
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
    ];
    for (final (fixture, expected) in cases) {
      test("$fixture is $expected", () {
        final result = eval(fixture, {});
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
    ];
    for (final (fixture, expected) in cases) {
      test("$fixture is $expected", () {
        final result = eval(fixture, {});
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
    ];

    for (final (fixture, context, expected) in cases) {
      test("$fixture is $expected", () {
        final result = eval(fixture, context);
        expect(result, equals(expected));
      });
    }
  });
}
