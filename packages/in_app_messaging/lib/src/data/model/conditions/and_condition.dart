import 'package:in_app_messaging/src/core/typedefs.dart';

import '../../../domain/entity/message_condition.dart';

/// JsonLogic conjunction of two message-selection conditions.
class AndCondition extends MessageCondition {
  /// Left side of the generated `and` expression.
  final MessageCondition left;

  /// Right side of the generated `and` expression.
  final MessageCondition right;

  /// Creates a conjunction of [left] and [right].
  AndCondition(this.left, this.right);

  /// Emits `{ "and": [left, right] }`.
  @override
  JsonMap asJsonLogic() {
    return {
      "and": [
        left.asJsonLogic(),
        right.asJsonLogic(),
      ]
    };
  }
}
