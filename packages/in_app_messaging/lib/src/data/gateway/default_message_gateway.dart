import 'dart:async';

import 'package:async/async.dart';
import '../../../in_app_messaging.dart';
import '../../domain/entity/message_context.dart';

class DefaultMessageGateway implements MessageGateway {
  final MessageSource _messageSource;
  final InteractionSource _interactionSource;

  final AsyncCache<List<Message>> _messages =
      AsyncCache(const Duration(minutes: 5));

  DefaultMessageGateway({
    required MessageSource messageSource,
    required InteractionSource interactionSource,
  })  : _messageSource = messageSource,
        _interactionSource = interactionSource;

  @override
  FutureOr<MessageWithContext?> evaluate(MessageTrigger trigger) async {
    final messages =
        await _messages.fetch(() async => _messageSource.fetchMessages());

    for (final message in messages) {
      final interactions = await getInteractions(message.id);
      final context =
          MessageContext(trigger: trigger, interactions: interactions);
      if (message.condition.evaluate(context)) {
        return MessageWithContext(
          message: message,
          context: context,
          interact: Interact(message: message, gateway: this),
        );
      }
    }

    return null;
  }

  FutureOr<MessageInteractions> getInteractions(String id) async {
    return _interactionSource.getInteractions(id);
  }

  @override
  FutureOr<void> interact<T>(String id, String key, T data) {
    return _interactionSource.interact(id, key, data);
  }

  @override
  FutureOr<void> markSeen(String id) {
    return _interactionSource.markSeen(id);
  }
}
