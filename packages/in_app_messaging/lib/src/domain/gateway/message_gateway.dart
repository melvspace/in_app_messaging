import 'dart:async';

import 'package:in_app_messaging/in_app_messaging.dart';

/// Boundary between message selection and interaction persistence.
abstract interface class MessageGateway {
  /// Selects a message for [event], or returns null when no message qualifies.
  FutureOr<DynamicMessageContext?> evaluate(
    String event,
    Map<String, dynamic> properties,
  );

  /// Persists that [id] became visible for an optional triggering event.
  FutureOr<void> markSeen({
    required String id,
    String? trigger,
    Map<String, dynamic>? triggerProperties,
  });

  /// Updates a user property used by future condition evaluations.
  FutureOr<void> setUserProperty(String key, String? value);

  /// Updates a device property used by future condition evaluations.
  FutureOr<void> setDeviceProperty(String key, String? value);
}
