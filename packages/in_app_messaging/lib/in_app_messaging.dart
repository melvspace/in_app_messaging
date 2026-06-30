import 'dart:async';

import 'package:in_app_messaging/src/in_app_messaging_logger.dart';

import 'src/domain/domain.dart';

import 'src/presentation/presenter/in_app_message_presenter_key.dart';
import 'src/presentation/presenter/presentation_outcome.dart';
export 'src/data/data.dart';
export 'src/domain/domain.dart';
export 'src/presentation/presentation.dart';

class InAppMessaging {
  static InAppMessaging? _instance;

  final MessageGateway gateway;

  InAppMessaging._({required this.gateway});

  factory InAppMessaging.initialize({required MessageGateway gateway}) {
    _instance?.dispose();
    logger.info('Instance initialized');
    return _instance = InAppMessaging._(gateway: gateway);
  }

  static InAppMessaging get instance => _instance!;

  Future<bool> trigger(String event, Map<String, dynamic> properties) async {
    logger.info('Trigger received - $event');
    final context = await gateway.evaluate(event, properties);

    final message = context?.message;

    if (context == null || message == null) {
      logger.info('No message triggered for $event');
      return Future.value(false);
    }

    logger.info(
      'Message(${message.id}) of ${message.type.runtimeType} type triggered and enqueued',
    );

    final outcome = await inAppMessagePresenterKey.currentState //
            ?.enqueue(context) ??
        const PresentationOutcome.notShown(
            PresentationNotShownReason.cancelled);

    await _markSeen(outcome, context);

    return _logSeen(outcome, message);
  }

  void setSuppressed(
    bool value, {
    Duration bufferDuration = Duration.zero,
    String key = 'default',
  }) {
    inAppMessagePresenterKey.currentState?.setSuppressed(
      value,
      bufferDuration: bufferDuration,
      key: key,
    );
  }

  FutureOr<void> dispose() async {
    inAppMessagePresenterKey.currentState?.clear();
  }

  bool _logSeen(PresentationOutcome outcome, Message message) {
    if (outcome.isShown) {
      logger.info(
          'Message(${message.id}) of ${message.type.runtimeType} type shown');
    } else {
      final reason = switch (outcome) {
        PresentationNotShown(:final reason) => reason.name,
        PresentationShown() => null,
      };
      logger.info('Message(${message.id}) of ${message.type.runtimeType} type '
          'not shown: $reason');
    }

    return outcome.isShown;
  }

  Future<void> _markSeen(
    PresentationOutcome outcome,
    MessageContext context,
  ) async {
    if (outcome.isShown) {
      await gateway.markSeen(
        id: context.message.id,
        trigger: context.map(
          dynamic: (value) => value.trigger.mapOrNull(
            event: (value) => value.event,
          ),
        ),
        triggerProperties: context.mapOrNull(
          dynamic: (value) => value.trigger.mapOrNull(
            event: (value) => value.data,
          ),
        ),
      );
    }
  }
}
