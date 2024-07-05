import 'dart:async';
import 'dart:collection';
import 'dart:developer';

import 'package:flutter/material.dart';
import '../../../in_app_messaging.dart';
import 'in_app_message_presenter_key.dart';

typedef InAppMessageBuilders = Map<MessageType, InAppMessageBuilder>;

class InAppMessagePresenter extends StatefulWidget {
  final Widget child;
  final InAppMessageBuilders builders;
  final bool initiallySuppressed;

  /// Use it if you place presenter over navigator
  final GlobalKey<NavigatorState>? navigatorKey;

  InAppMessagePresenter({
    required this.child,
    InAppMessageBuilders builders = const {},
    this.navigatorKey,
    this.initiallySuppressed = false,
  })  : builders = {
          // TODO(@melvspace): 07/05/24 spread default builders
          ...builders,
        },
        super(key: inAppMessagePresenterKey);

  @override
  State<InAppMessagePresenter> createState() => InAppMessagePresenterState();
}

class InAppMessagePresenterState extends State<InAppMessagePresenter> {
  final Queue<MessageWithContext> pending = Queue();
  final Map<Message, Completer<bool>> _completers = {};

  late bool _suppressed = widget.initiallySuppressed;

  InAppMessageLifecycle? _active;
  InAppMessageLifecycle? get active => _active;
  set active(InAppMessageLifecycle? value) {
    if (_active != value && mounted) {
      value?.onShow(context, widget.navigatorKey?.currentState).then(
        (value) {
          log('[InAppMessaging]: Message(${active?.tuple.message.id}) closed');

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
  Future<bool> enqueue(MessageWithContext tuple) {
    final completer = Completer<bool>();
    _completers[tuple.message]?.complete(false);
    _completers[tuple.message] = completer;

    pending.remove(tuple);
    pending.add(tuple);

    _checkQueue();

    return completer.future;
  }

  void _checkQueue() {
    if (_suppressed) {
      log('[InAppMessagingPresenter.checkQueue]: Suppressed, skipping queue check');
      return;
    }

    if (active != null) {
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

    active = builder(tuple);

    _completers.remove(message)?.complete(true);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
