import 'dart:async';

import 'package:in_app_messaging/src/domain/entity/messages/message.dart';

/// Supplies configured messages to the gateway.
abstract interface class MessageSource {
  /// Fetches message definitions available for selection.
  FutureOr<List<Message>> fetchMessages();
}
