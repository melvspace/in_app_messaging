import 'package:in_app_messaging/src/domain/entity/messages/message.dart';

import '../message_source.dart';

/// Message source for tests and demos.
class MemoryMessageSource implements MessageSource {
  /// Messages returned on every fetch.
  final List<Message> messages;

  /// Keeps [messages] by reference for lightweight tests and demos.
  MemoryMessageSource({required this.messages});

  /// Returns the configured message list.
  @override
  List<Message> fetchMessages() {
    return messages;
  }
}
