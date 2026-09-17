abstract class ConditionObject {
  dynamic accessKey(String key) {
    return null;
  }

  dynamic accessIndex(int index) {
    return null;
  }

  bool less(Object other) {
    return false;
  }

  bool greater(Object other) {
    return false;
  }

  bool equals(Object other) {
    return false;
  }
}
