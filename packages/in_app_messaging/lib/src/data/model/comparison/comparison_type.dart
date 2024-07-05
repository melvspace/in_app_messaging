import 'package:version/version.dart';

enum ComparisonType {
  exactlyMatches,
  contains,
  doesNotContains,
  containsRegex,

  // numeric comparison
  greater,
  greaterOrEquals,
  less,
  lessOrEquals,
  equals,
  notEquals;

  // TODO(@melvspace): 07/05/24 compares semver
  bool compare(dynamic left, dynamic right) {
    switch (this) {
      case ComparisonType.exactlyMatches:
        return left == right;

      case ComparisonType.contains:
        return left is String && right is String && left.contains(right);

      case ComparisonType.doesNotContains:
        return left is String && right is String && !left.contains(right);

      case ComparisonType.containsRegex:
        return left is String &&
            right is String &&
            !left.contains(RegExp(right));

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
