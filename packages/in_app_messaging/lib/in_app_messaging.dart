library in_app_messaging;

import 'dart:async';
import 'dart:developer';

import 'src/domain/entity/message.dart';
import 'src/domain/entity/message_trigger.dart';
import 'src/domain/gateway/message_gateway.dart';
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

  Future<bool> trigger(MessageTrigger trigger) async {
    final tuple = await gateway.evaluate(trigger);
    final message = tuple?.message;

    if (tuple == null || message == null) {
      log('[InAppMessaging]: No message triggered for $trigger');
      return Future.value(false);
    }

    log('[InAppMessaging]: Message(${message.id}) of ${message.type.runtimeType} type triggered and enqueued');
    return inAppMessagePresenterKey.currentState //
            ?.enqueue(tuple)
            .then((value) => _markSeen(value, message))
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

  Future<bool> _markSeen(bool value, Message message) async {
    if (value) {
      await gateway.markSeen(message.id);
    }

    return value;
  }
}
