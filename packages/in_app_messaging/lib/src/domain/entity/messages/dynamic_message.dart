import 'package:in_app_messaging/in_app_messaging.dart';
import 'package:in_app_messaging/src/domain/entity/messages/message.dart';

/// Message template
abstract class DynamicMessage extends Message {
  List<MessageTrigger> get triggers;
}
