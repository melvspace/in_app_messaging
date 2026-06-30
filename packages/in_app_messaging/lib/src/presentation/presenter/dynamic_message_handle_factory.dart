import 'package:in_app_messaging/in_app_messaging.dart';

/// Builds the UI adapter for a selected dynamic message context.
typedef DynamicMessageHandleFactory = DynamicMessageHandle Function(
  DynamicMessageContext context,
);
