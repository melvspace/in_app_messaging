import '../../../domain/entity/message_condition.dart';
import '../../../domain/entity/message_context.dart';
import '../../../domain/entity/message_trigger.dart';

class TriggerCondition extends MessageCondition {
  final MessageTrigger trigger;

  TriggerCondition({required this.trigger});

  @override
  bool evaluate(MessageContext context) {
    return context.trigger == trigger;
  }
}
