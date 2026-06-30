import 'package:in_app_messaging/src/core/typedefs.dart';

import '../../../domain/entity/message_condition.dart';

/// JsonLogic disjunction of two message-selection conditions.
class OrCondition extends MessageCondition {
  /// Left side of the generated `or` expression.
  final MessageCondition left;

  /// Right side of the generated `or` expression.
  final MessageCondition right;

  /// Creates a disjunction of [left] and [right].
  OrCondition(this.left, this.right);

  /// Emits `{ "or": [left, right] }`.
  @override
  JsonMap asJsonLogic() {
    return {
      'or': [
        left.asJsonLogic(),
        right.asJsonLogic(),
      ],
    };
  }
}
