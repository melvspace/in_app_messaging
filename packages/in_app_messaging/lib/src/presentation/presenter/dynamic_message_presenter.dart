import 'dart:async';
import 'dart:collection';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:in_app_messaging/in_app_messaging.dart';
import 'in_app_message_presenter_key.dart';

typedef DynamicMessageHandleFactories
    = Map<MessageType, DynamicMessageHandleFactory>;

class DynamicMessagePresenter extends StatefulWidget {
  final Widget child;
  final DynamicMessageHandleFactories builders;
  final bool initiallySuppressed;

  /// Use it if you place presenter over navigator
  final GlobalKey<NavigatorState>? navigatorKey;

  DynamicMessagePresenter({
    required this.child,
    DynamicMessageHandleFactories builders = const {},
    this.navigatorKey,
    this.initiallySuppressed = false,
  })  : builders = {
          // TODO(@melvspace): 07/05/24 spread default builders
          ...builders,
        },
        super(key: inAppMessagePresenterKey);

  @override
  State<DynamicMessagePresenter> createState() =>
      DynamicMessagePresenterState();
}

class DynamicMessagePresenterState extends State<DynamicMessagePresenter> {
  final Queue<DynamicMessageContext> pending = Queue();
  final Map<DynamicMessage, Completer<bool>> _completers = {};

  late bool _suppressed = widget.initiallySuppressed;

  DynamicMessageHandle? _active;
  DynamicMessageHandle? get active => _active;
  set active(DynamicMessageHandle? value) {
    if (_active != value && mounted) {
      value?.onShow(context, widget.navigatorKey?.currentState).then(
        (value) {
          log('[InAppMessaging]: Message(${active?.context.message.id}) closed');

          active = null;
          _checkQueue();
        },
      );
    }

    _active = value;
  }

  void setSuppressed(bool value) {
    log('[InAppMessagingPresenter]: Suppressed - $value');
    _suppressed = value;

    if (!value) {
      _checkQueue();
    }
  }

  void clear() {
    pending.clear();
    active = null;
  }

  /// Returns future which ends with true if message was delivered and seen.
  Future<bool> enqueue(DynamicMessageContext context) {
    final completer = Completer<bool>();
    _completers[context.message]?.complete(false);
    _completers[context.message] = completer;

    pending.remove(context);
    pending.add(context);

    _checkQueue();

    return completer.future;
  }

  void _checkQueue() {
    if (_suppressed) {
      log('[InAppMessagingPresenter.checkQueue]: Suppressed, skipping queue check');
      return;
    }

    if (this.active != null) {
      log('[InAppMessagingPresenter.checkQueue]: Has active message, skipping queue check');
      return;
    }

    if (pending.isEmpty) {
      log('[InAppMessagingPresenter.checkQueue]: Queue is empty, skipping queue check');
      return;
    }

    final tuple = pending.removeFirst();
    final message = tuple.message;

    final builder = widget.builders[tuple.message.type];
    if (builder == null) {
      log('[InAppMessagingPresenter.checkQueue]: No builder found for ${message.type} type, skipping message');
      _completers.remove(message)?.complete(false);
      return;
    }

    final active = this.active = builder(tuple);

    _completers.remove(message)?.complete(active.canShow(context));
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
