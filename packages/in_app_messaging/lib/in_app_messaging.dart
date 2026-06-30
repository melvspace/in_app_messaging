/// Public API for in-app messaging evaluation, persistence, and presentation.
library;

import 'dart:async';

import 'package:in_app_messaging/src/in_app_messaging_logger.dart';

import 'src/domain/domain.dart';

import 'src/presentation/presenter/in_app_message_presenter_key.dart';
import 'src/presentation/presenter/presentation_outcome.dart';
export 'src/data/data.dart';
export 'src/domain/domain.dart';
export 'src/presentation/presentation.dart';

/// Facade used by application code to trigger and suppress in-app messages.
class InAppMessaging {
  static InAppMessaging? _instance;

  /// Evaluates trigger events and persists seen entries.
  final MessageGateway gateway;

  InAppMessaging._({required this.gateway});

  /// Replaces the active singleton and disposes any previous presenter state.
  factory InAppMessaging.initialize({required MessageGateway gateway}) {
    _instance?.dispose();
    logger.info('Instance initialized');
    return _instance = InAppMessaging._(gateway: gateway);
  }

  /// Active singleton created by [InAppMessaging.initialize].
  static InAppMessaging get instance => _instance!;

  /// Runs message selection for [event] and enqueues the selected message.
  ///
  /// Returns true only when presentation reported that the message became
  /// visible. Seen history is recorded after visibility is confirmed, not when
  /// a message is merely selected.
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

  /// Adds or removes a suppression key on the active presenter.
  ///
  /// While any key is suppressed, selected messages stay queued. [bufferDuration]
  /// delays unsuppression so route transitions can finish before presentation
  /// resumes.
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

  /// Cancels queued presentations held by the active presenter.
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
