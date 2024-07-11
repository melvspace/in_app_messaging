import 'package:in_app_messaging/in_app_messaging.dart';

/// Message template
abstract class Message {
  String get id;
  bool get enabled;
  MessageType get type;

  DateTime get start;
  DateTime? get end;

  MessageCondition? get condition;

  Map<String, dynamic> get data;
}
