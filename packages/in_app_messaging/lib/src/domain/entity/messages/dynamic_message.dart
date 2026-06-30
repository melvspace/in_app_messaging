import 'package:in_app_messaging/in_app_messaging.dart';

/// A message selected by application events or scheduled triggers.
abstract class DynamicMessage extends Message {
  /// Trigger rules that can make this message a candidate for presentation.
  List<MessageTrigger> get triggers;

  /// Priority used when multiple messages are eligible for the same event.
  int get priority => 0;
}
