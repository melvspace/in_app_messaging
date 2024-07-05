import 'dart:async';

import 'package:async/async.dart';
import '../../../in_app_messaging.dart';

class DefaultMessageGateway implements MessageGateway {
  final MessageSource _messageSource;
  final InteractionSource _interactionSource;
  final ContextSource _contextSource;

  final AsyncCache<List<Message>> _messages =
      AsyncCache(const Duration(minutes: 5));

  DefaultMessageGateway({
    required MessageSource messageSource,
    required InteractionSource interactionSource,
    required ContextSource contextSource,
  })  : _messageSource = messageSource,
        _interactionSource = interactionSource,
        _contextSource = contextSource;

  @override
  FutureOr<MessageWithContext?> evaluate(MessageTrigger trigger) async {
    Iterable<Message> messages =
        await _messages.fetch(() async => _messageSource.fetchMessages());

    messages =
        messages.where((element) => element.triggers.any(trigger.contains));

    for (final message in messages) {
      final interactions = await getInteractions(message.id);
      final context = MessageContext(
        trigger: trigger,
        interactions: interactions,
        user: await _contextSource.getUser(),
        device: await _contextSource.getDevice(),
      );

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

  @override
  FutureOr<void> setDeviceProperty(String key, value) {
    return _contextSource.updateDeviceProperty(key, value);
  }

  @override
  FutureOr<void> setUserProperty(String key, value) {
    return _contextSource.updateUserProperty(key, value);
  }
}
