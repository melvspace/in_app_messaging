import 'dart:async';

import 'package:in_app_messaging/in_app_messaging.dart';

abstract interface class MessageGateway {
  FutureOr<DynamicMessageContext?> evaluate(
    String event,
    Map<String, dynamic> properties,
  );

  FutureOr<void> markSeen({
    required String id,
    String? trigger,
    Map<String, dynamic>? triggerProperties,
  });

  FutureOr<void> setUserProperty(String key, String? value);

  FutureOr<void> setDeviceProperty(String key, String? value);
}
