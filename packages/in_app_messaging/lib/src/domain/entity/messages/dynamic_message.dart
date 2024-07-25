import 'package:in_app_messaging/in_app_messaging.dart';

/// Message template
abstract class DynamicMessage extends Message {
  List<MessageTrigger> get triggers;
  int get priority => 0;
}
