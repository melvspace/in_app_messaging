import 'package:in_app_messaging/src/domain/entity/messages/message.dart';

import '../message_source.dart';

class MemoryMessageSource implements MessageSource {
  final List<Message> messages;

  MemoryMessageSource({required this.messages});

  @override
  List<Message> fetchMessages() {
    return messages;
  }
}
