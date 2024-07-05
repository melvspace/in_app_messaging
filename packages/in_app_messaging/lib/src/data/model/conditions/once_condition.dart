import 'package:in_app_messaging/in_app_messaging.dart';

class OnceCondition extends MessageCondition {
  @override
  bool evaluate(MessageContext context) {
    return context.interactions.seenDates.isEmpty;
  }
}
