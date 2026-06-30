import 'package:version/version.dart';

/// Comparison operations available to property-based targeting conditions.
enum ComparisonType {
  /// Compares values without parsing or coercion.
  exactlyMatches,

  /// Requires the runtime string to contain the configured string.
  contains,

  /// Requires the runtime string not to contain the configured string.
  doesNotContains,

  /// Tests the runtime string against the configured regular expression.
  containsRegex,

  /// Parses comparable values and requires runtime value to be greater.
  greater,

  /// Parses comparable values and allows equality at the lower bound.
  greaterOrEquals,

  /// Parses comparable values and requires runtime value to be less.
  less,

  /// Parses comparable values and allows equality at the upper bound.
  lessOrEquals,

  /// Parses versions, numbers, then strings and requires equality.
  equals,

  /// Parses versions, numbers, then strings and requires inequality.
  notEquals;

  // TODO(@melvspace): 07/05/24 compares semver
  /// Compares [left] and [right] using the parsing strategy for this value.
  bool compare(dynamic left, dynamic right) {
    switch (this) {
      case ComparisonType.exactlyMatches:
        return left == right;

      case ComparisonType.contains:
        return left is String && right is String && left.contains(right);

      case ComparisonType.doesNotContains:
        return left is String && right is String && !left.contains(right);

      case ComparisonType.containsRegex:
        if (left is! String || right is! String) return false;
        try {
          return RegExp(right).hasMatch(left);
        } on FormatException {
          return false;
        }

      case ComparisonType.equals:
      case ComparisonType.notEquals:
      case ComparisonType.greater:
      case ComparisonType.greaterOrEquals:
      case ComparisonType.less:
      case ComparisonType.lessOrEquals:
        return compareVersions(left, right, this) ||
            compareNumbers(left, right, this) ||
            compareStrings(left, right, this);
    }
  }

  /// Compares semantic-version strings using [type].
  bool compareVersions(String left, String right, ComparisonType type) {
    try {
      Version leftVersion = Version.parse(left);
      Version rightVersion = Version.parse(right);

      switch (type) {
        case ComparisonType.equals:
          return leftVersion == rightVersion;

        case ComparisonType.notEquals:
          return leftVersion != rightVersion;

        case ComparisonType.greater:
          return leftVersion > rightVersion;

        case ComparisonType.greaterOrEquals:
          return leftVersion >= rightVersion;

        case ComparisonType.less:
          return leftVersion < rightVersion;

        case ComparisonType.lessOrEquals:
          return leftVersion <= rightVersion;

        default:
          return false;
      }
    } catch (e) {
      return false;
    }
  }

  /// Compares number strings using [type].
  bool compareNumbers(String left, String right, ComparisonType type) {
    try {
      num leftNum = num.parse(left);
      num rightNum = num.parse(right);

      switch (type) {
        case ComparisonType.equals:
          return leftNum == rightNum;

        case ComparisonType.notEquals:
          return leftNum != rightNum;

        case ComparisonType.greater:
          return leftNum > rightNum;

        case ComparisonType.greaterOrEquals:
          return leftNum >= rightNum;

        case ComparisonType.less:
          return leftNum < rightNum;

        case ComparisonType.lessOrEquals:
          return leftNum <= rightNum;

        default:
          return false;
      }
    } catch (e) {
      return false;
    }
  }

  /// Compares strings with equality operators only.
  bool compareStrings(String left, String right, ComparisonType type) {
    try {
      switch (type) {
        case ComparisonType.equals:
          return left == right;

        case ComparisonType.notEquals:
          return left != right;

        default:
          return false;
      }
    } catch (e) {
      return false;
    }
  }
}
