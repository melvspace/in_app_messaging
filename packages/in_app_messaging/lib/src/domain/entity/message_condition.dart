import '../../data/model/conditions/and_condition.dart';
import '../../data/model/conditions/or_condition.dart';

/// Composable predicate that emits JsonLogic for message selection.
abstract class MessageCondition {
  /// JsonLogic expression consumed during message evaluation.
  dynamic asJsonLogic();

  /// Combines this condition with [right] using JsonLogic `and`.
  MessageCondition operator &(MessageCondition? right) {
    if (right == null) return this;

    return AndCondition(this, right);
  }

  /// Combines this condition with [right] using JsonLogic `or`.
  MessageCondition operator |(MessageCondition? right) {
    if (right == null) return this;

    return OrCondition(this, right);
  }
}
