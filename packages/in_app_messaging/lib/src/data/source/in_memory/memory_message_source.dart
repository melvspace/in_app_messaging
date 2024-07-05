import '../message_source.dart';
import '../../../domain/entity/message.dart';

class MemoryMessageSource implements MessageSource {
  final List<Message> messages;

  MemoryMessageSource({required this.messages});

  @override
  List<Message> fetchMessages() {
    return messages;
  }
}
