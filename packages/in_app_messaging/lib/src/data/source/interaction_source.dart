import 'dart:async';

import '../../../in_app_messaging.dart';

abstract interface class InteractionSource {
  FutureOr<MessageInteractions> getInteractions(String id);

  FutureOr<void> markSeen({
    required String id,
    String? trigger,
    Map<String, dynamic>? triggerProperties,
  });
}
