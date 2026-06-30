import 'package:in_app_messaging/in_app_messaging.dart';

/// A message selected by application events or scheduled triggers.
abstract class DynamicMessage extends Message {
  /// Trigger rules that can make this message eligible for display.
  List<MessageTrigger> get triggers;

  /// Ordering value used when multiple messages are eligible for the same event.
  ///
  /// Lower values are evaluated first. The default priority is 0.
  int get priority => 0;
}
