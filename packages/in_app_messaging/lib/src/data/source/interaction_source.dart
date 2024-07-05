import 'dart:async';

import '../../../in_app_messaging.dart';

abstract interface class InteractionSource {
  FutureOr<MessageInteractions> getInteractions(String id);

  FutureOr<void> interact<T>(String id, String key, T data);

  FutureOr<void> markSeen(String id);
}
