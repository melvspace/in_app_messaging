import 'dart:async';

import '../entity/message_trigger.dart';
import '../entity/message_with_context.dart';

abstract interface class MessageGateway {
  FutureOr<MessageWithContext?> evaluate(MessageTrigger trigger);

  FutureOr<void> interact<T>(String id, String key, T data);

  FutureOr<void> markSeen(String id);
}
