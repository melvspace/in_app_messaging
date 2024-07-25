import 'package:in_app_messaging/in_app_messaging.dart';
import 'package:in_app_messaging/src/core/typedefs.dart';

/// Message template
abstract class Message {
  String get id;
  bool get enabled;
  MessageType get type;

  DateTime get start;
  DateTime? get end;

  JsonMap? get condition;

  JsonMap get data;

  JsonMap toJson();
}
