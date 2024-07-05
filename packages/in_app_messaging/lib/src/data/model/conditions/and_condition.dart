import '../../../domain/entity/message_condition.dart';
import '../../../domain/entity/message_context.dart';

class AndCondition extends MessageCondition {
  final MessageCondition left;
  final MessageCondition right;

  AndCondition(this.left, this.right);

  @override
  bool evaluate(MessageContext context) {
    return left.evaluate(context) && right.evaluate(context);
  }
}
