import 'dart:async';

import 'package:in_app_messaging/in_app_messaging.dart';

abstract interface class MessageGateway {
  FutureOr<DynamicMessageContext?> evaluate(
    String event,
    Map<String, dynamic> properties,
  );

  FutureOr<void> interact<T>(String id, String key, T data);

  FutureOr<void> markSeen(String id);

  FutureOr<void> setUserProperty(String key, String? value);

  FutureOr<void> setDeviceProperty(String key, String? value);
}
