import 'message_condition.dart';
import 'message_type.dart';

/// Message template
abstract class Message {
  String get id;
  MessageType get type;
  MessageCondition get condition;
  Map<String, dynamic> get data;
}
