import 'dart:async';

import '../../../in_app_messaging.dart';

/// Persistence boundary for message interaction history.
abstract interface class InteractionSource {
  /// Loads history used while evaluating the message with [id].
  FutureOr<MessageInteractions> getInteractions(String id);

  /// Records a visible presentation for the message with [id].
  FutureOr<void> markSeen({
    required String id,
    String? trigger,
    Map<String, dynamic>? triggerProperties,
  });
}
