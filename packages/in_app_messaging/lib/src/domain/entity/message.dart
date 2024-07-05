import 'package:in_app_messaging/in_app_messaging.dart';

import 'message_condition.dart';
import 'message_type.dart';

/// Message template
abstract class Message {
  String get id;
  MessageType get type;
  List<MessageTrigger> get triggers;
  MessageCondition get condition;
  Map<String, dynamic> get data;
}
