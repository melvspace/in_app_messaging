/// An exception raised while evaluating a JsonLogic rule.
class JsonlogicException implements Exception {
  /// Explanation of the evaluation failure.
  final String message;

  /// Wraps an evaluator or operator failure.
  const JsonlogicException(this.message);

  @override
  String toString() => 'JsonlogicException: $message';
}
