import '../../../domain/entity/message_condition.dart';
import '../../../domain/entity/message_context.dart';

class OrCondition extends MessageCondition {
  final MessageCondition left;
  final MessageCondition right;

  OrCondition(this.left, this.right);

  @override
  bool evaluate(MessageContext context) {
    return left.evaluate(context) || right.evaluate(context);
  }
}
