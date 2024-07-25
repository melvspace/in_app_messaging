library in_app_messaging;

import 'dart:async';
import 'dart:developer';

import 'package:in_app_messaging/in_app_messaging.dart';

import 'src/presentation/presenter/in_app_message_presenter_key.dart';
export 'src/data/data.dart';
export 'src/domain/domain.dart';
export 'src/presentation/presentation.dart';

class InAppMessaging {
  static InAppMessaging? _instance;

  final MessageGateway gateway;

  InAppMessaging._({required this.gateway});

  factory InAppMessaging.initialize({required MessageGateway gateway}) {
    _instance?.dispose();
    log('[InAppMessaging]: Instance initialized');
    return _instance = InAppMessaging._(gateway: gateway);
  }

  static InAppMessaging get instance => _instance!;

  Future<bool> trigger(String event, Map<String, dynamic> properties) async {
    log('[InAppMessaging]: trigger received - $event');
    final context = await gateway.evaluate(event, properties);

    final message = context?.message;

    if (context == null || message == null) {
      log('[InAppMessaging]: No message triggered for $event');
      return Future.value(false);
    }

    log('[InAppMessaging]: Message(${message.id}) of ${message.type.runtimeType} type triggered and enqueued');
    return inAppMessagePresenterKey.currentState //
            ?.enqueue(context)
            .then((value) => _markSeen(value, context))
            .then((value) => _logSeen(value, message)) ??
        Future.value(false);
  }

  void setSuppressed(bool value) {
    inAppMessagePresenterKey.currentState?.setSuppressed(value);
  }

  FutureOr<void> dispose() async {
    inAppMessagePresenterKey.currentState?.clear();
  }

  bool _logSeen(bool seen, Message message) {
    if (seen) {
      log('[InAppMessaging]: Message(${message.id}) of ${message.type.runtimeType} type delivered');
    } else {
      log('[InAppMessaging]: Message(${message.id}) of ${message.type.runtimeType} type cancelled');
    }

    return seen;
  }

  Future<bool> _markSeen(bool value, MessageContext context) async {
    if (value) {
      await gateway.markSeen(
        id: context.message.id,
        trigger: context.map(
          static: (value) => value.slot.id,
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

    return value;
  }
}
