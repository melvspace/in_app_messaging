import 'package:in_app_messaging_condition/src/runtime/condition_function.dart';

/// Defines expression operations for a value used in a condition context.
///
/// Returning `null` from an access or arithmetic operation indicates that the
/// operation is unsupported or has no value.
abstract class ConditionObject {
  /// Resolves an instance function named [name] for this value.
  ///
  /// Implementations return a receiver-bound callback, or `null` when the
  /// function is not exposed by this value.
  ConditionFunction? resolveFunction(String name) {
    return null;
  }

  /// Reads the property named [key], or returns `null` when it is unavailable.
  dynamic accessKey(String key) {
    return null;
  }

  /// Reads [index], or returns `null` when it is unavailable.
  dynamic accessIndex(int index) {
    return null;
  }

  /// Whether this value sorts before [other].
  bool less(Object other) {
    return false;
  }

  /// Whether this value sorts after [other].
  bool greater(Object other) {
    return false;
  }

  /// Whether this value is equal to [other].
  bool equals(Object other) {
    return false;
  }

  /// Returns the result of adding [other] to this value.
  Object? add(Object other) {
    return null;
  }

  /// Returns the result of subtracting [other] from this value.
  Object? subtract(Object other) {
    return null;
  }

  /// Returns the result of multiplying this value by [other].
  Object? multiply(Object other) {
    return null;
  }

  /// Returns the result of dividing this value by [other].
  Object? divide(Object other) {
    return null;
  }

  /// Returns the remainder after dividing this value by [other].
  Object? remainder(Object other) {
    return null;
  }

  /// Returns this value with unary plus applied.
  Object? positive() {
    return null;
  }

  /// Returns this value with unary minus applied.
  Object? negate() {
    return null;
  }
}
