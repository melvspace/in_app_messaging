import 'package:in_app_messaging/src/domain/entity/message_slot.dart';
import 'package:in_app_messaging/src/domain/entity/messages/message.dart';

/// Message template
abstract class StaticMessage extends Message {
  List<MessageSlot> get slots;
}
