import 'package:in_app_messaging_condition/src/eval.dart';
import 'package:in_app_messaging_condition/src/runtime/condition_context.dart';
import 'package:in_app_messaging_condition/src/runtime/condition_object.dart';
import 'package:test/test.dart';
import 'package:version/version.dart' as v;

class Version extends ConditionObject {
  Version(String version) : _version = v.Version.parse(version);

  final v.Version _version;

  @override
  bool less(Object other) {
    if (other is! Version) return false;
    return _version < other._version;
  }

  @override
  bool equals(Object other) {
    if (other is! Version) return false;
    return _version == other._version;
  }

  @override
  bool greater(Object other) {
    if (other is! Version) return false;
    return _version > other._version;
  }
}

class AccessibleObject extends ConditionObject {
  AccessibleObject({
    this.keys = const {},
    this.items = const [],
  });

  final Map<String, Object?> keys;
  final List<Object?> items;

  @override
  Object? accessKey(String key) => keys[key];

  @override
  Object? accessIndex(int index) => items[index];
}

class ArithmeticObject extends ConditionObject {
  ArithmeticObject(this.value);

  final num value;

  @override
  Object add(covariant num other) => value + other;

  @override
  Object subtract(covariant num other) => value - other;

  @override
  Object multiply(covariant num other) => value * other;

  @override
  Object divide(covariant num other) => value / other;

  @override
  Object remainder(covariant num other) => value % other;

  @override
  Object positive() => value;

  @override
  Object negate() => -value;
}

void main() {
  group("custom object access", () {
    final object = AccessibleObject(
      keys: {"key": "dot", "arbitrary-key": "bracket"},
      items: ["zero", "one", "two", "three"],
    );

    final cases = [
      ('object.key == "dot"', true),
      ('object["arbitrary-key"] == "bracket"', true),
      ('object[3] == "three"', true),
    ];

    for (final (condition, expected) in cases) {
      test(
        "`$condition` -> $expected",
        () => expect(
          eval(condition, ConditionContext(values: {"object": object})),
          equals(expected),
        ),
      );
    }
  });

  group("custom object arithmetic", () {
    final cases = [
      ("value + 2 == 12", true),
      ("value - 2 == 8", true),
      ("value * 2 == 20", true),
      ("value / 2 == 5", true),
      ("value % 3 == 1", true),
      ("+value == 10", true),
      ("-value == -10", true),
    ];

    for (final (condition, expected) in cases) {
      test(
        "`$condition` -> $expected",
        () => expect(
          eval(
            condition,
            ConditionContext(values: {"value": ArithmeticObject(10)}),
          ),
          equals(expected),
        ),
      );
    }
  });

  group("date time comparison", () {
    final cases = [
      // A is before B
      ("a < b", {"a": DateTime(2020), "b": DateTime(2025)}, true),
      ("a > b", {"a": DateTime(2020), "b": DateTime(2025)}, false),
      ("a >= b", {"a": DateTime(2020), "b": DateTime(2025)}, false),
      ("a <= b", {"a": DateTime(2020), "b": DateTime(2025)}, true),
      ("a == b", {"a": DateTime(2020), "b": DateTime(2025)}, false),

      // A is after B
      ("a < b", {"a": DateTime(2030), "b": DateTime(2025)}, false),
      ("a > b", {"a": DateTime(2030), "b": DateTime(2025)}, true),
      ("a >= b", {"a": DateTime(2030), "b": DateTime(2025)}, true),
      ("a <= b", {"a": DateTime(2030), "b": DateTime(2025)}, false),
      ("a == b", {"a": DateTime(2030), "b": DateTime(2025)}, false),

      // Same moment
      ("a < b", {"a": DateTime(2025), "b": DateTime(2025)}, false),
      ("a > b", {"a": DateTime(2025), "b": DateTime(2025)}, false),
      ("a >= b", {"a": DateTime(2025), "b": DateTime(2025)}, true),
      ("a <= b", {"a": DateTime(2025), "b": DateTime(2025)}, true),
      ("a == b", {"a": DateTime(2025), "b": DateTime(2025)}, true),
    ];

    for (final (condition, context, expected) in cases) {
      test(
        "`$condition` -> $expected when $context",
        () => expect(
          eval(condition, ConditionContext(values: context)),
          equals(expected),
        ),
      );
    }
  });

  group("version comparison", () {
    final cases = [
      // A is before B
      ("a < b", {"a": Version("1.2.3"), "b": Version("2.0.0")}, true),
      ("a > b", {"a": Version("1.2.3"), "b": Version("2.0.0")}, false),
      ("a >= b", {"a": Version("1.2.3"), "b": Version("2.0.0")}, false),
      ("a <= b", {"a": Version("1.2.3"), "b": Version("2.0.0")}, true),
      ("a == b", {"a": Version("1.2.3"), "b": Version("2.0.0")}, false),

      // A is after B
      ("a < b", {"a": Version("2.0.0"), "b": Version("1.2.3")}, false),
      ("a > b", {"a": Version("2.0.0"), "b": Version("1.2.3")}, true),
      ("a >= b", {"a": Version("2.0.0"), "b": Version("1.2.3")}, true),
      ("a <= b", {"a": Version("2.0.0"), "b": Version("1.2.3")}, false),
      ("a == b", {"a": Version("2.0.0"), "b": Version("1.2.3")}, false),

      // Same version
      ("a < b", {"a": Version("1.2.3"), "b": Version("1.2.3")}, false),
      ("a > b", {"a": Version("1.2.3"), "b": Version("1.2.3")}, false),
      ("a >= b", {"a": Version("1.2.3"), "b": Version("1.2.3")}, true),
      ("a <= b", {"a": Version("1.2.3"), "b": Version("1.2.3")}, true),
      ("a == b", {"a": Version("1.2.3"), "b": Version("1.2.3")}, true),

      // Semantic version precedence
      ("a < b", {"a": Version("1.9.0"), "b": Version("1.10.0")}, true),
      ("a < b", {"a": Version("1.0.0-beta"), "b": Version("1.0.0")}, true),
    ];

    for (final (condition, context, expected) in cases) {
      test(
        "`$condition` -> $expected when $context",
        () => expect(
          eval(condition, ConditionContext(values: context)),
          equals(expected),
        ),
      );
    }
  });
}
