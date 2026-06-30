import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:in_app_messaging/in_app_messaging.dart';
import 'package:in_app_messaging/src/in_app_messaging_logger.dart';
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
  final Map<DynamicMessage, Completer<PresentationOutcome>> _completers = {};

  DynamicMessageHandle? _active;
  DynamicMessageHandle? get active => _active;

  final Set<String> _suppressKeys = {};
  final Map<String, Timer> _unsuppressTimers = {};

  bool get _suppressed => _suppressKeys.isNotEmpty;

  @override
  void initState() {
    super.initState();
    if (widget.initiallySuppressed) {
      _suppressKeys.add('default');
    }
  }

  /// Controls whether message presentation is suppressed ( paused ).
  ///
  /// When [value] is `true`, the presenter stops processing the pending queue
  /// and no messages are shown until unsuppressed.
  ///
  /// When [value] is `false`, suppression ends and the queue is processed.
  /// Use [bufferDuration] to delay unsuppression by that amount of time.
  ///
  /// **Why [bufferDuration] is needed:**
  /// During navigation (e.g. returning to a screen), you typically want to:
  /// - Suppress messages immediately when leaving.
  /// - Unsuppress when returning, but *not* immediately — otherwise a message
  ///   can flash or overlap with route/transition animations.
  /// [bufferDuration] provides a short delay so the UI can settle (transitions
  /// finish, overlays mount) before messages are shown again.
  ///
  /// If [bufferDuration] is set while a previous timer is still active, the
  /// call is ignored to avoid conflicting schedules.
  void setSuppressed(
    bool value, {
    Duration bufferDuration = Duration.zero,
    String key = 'default',
  }) {
    var unsuppressTimer = _unsuppressTimers[key];
    if (unsuppressTimer?.isActive == false) {
      _unsuppressTimers.remove(key);
      unsuppressTimer = null;
    }

    if (!value && unsuppressTimer != null) {
      logger.finest('setSuppressed(false): unsuppressTimer is not null, '
          'bufferDuration: $bufferDuration, key: $key');
      return;
    }

    if (!value && bufferDuration > Duration.zero) {
      logger.finest('setSuppressed(false): start unsuppressTimer with '
          'bufferDuration: $bufferDuration, key: $key');

      _unsuppressTimers[key] = Timer(bufferDuration, () {
        logger.finest('setSuppressed(false): unsuppressTimer expired, '
            'unsuppress messages, key: $key');

        _suppressKeys.remove(key);
        _unsuppressTimers.remove(key);

        if (!_suppressed) {
          logger.fine('[Presenter]: Suppressed - false');
          _checkQueue();
        }
      });

      return;
    }

    if (value && unsuppressTimer != null) {
      logger.finest('setSuppressed(true): cancel unsuppressTimer, key: $key');
      _unsuppressTimers[key]?.cancel();
      _unsuppressTimers.remove(key);
    }

    if (value) {
      _suppressKeys.add(key);

      logger.fine('[Presenter]: Suppressed - true, '
          'keys - ${_suppressKeys.join(', ')}');
    } else {
      _suppressKeys.remove(key);
    }

    if (!_suppressed) {
      logger.fine('[Presenter]: Suppressed - false');
      _checkQueue();
    }
  }

  void clear() {
    pending.clear();

    for (final completer in _completers.values) {
      if (!completer.isCompleted) {
        completer.complete(
          const PresentationOutcome.notShown(
            PresentationNotShownReason.cancelled,
          ),
        );
      }
    }

    _completers.clear();
    _active = null;
  }

  @override
  void dispose() {
    for (final timer in _unsuppressTimers.values) {
      timer.cancel();
    }

    _unsuppressTimers.clear();
    for (final completer in _completers.values) {
      if (!completer.isCompleted) {
        completer.complete(
          const PresentationOutcome.notShown(
            PresentationNotShownReason.cancelled,
          ),
        );
      }
    }

    _completers.clear();
    pending.clear();
    _active = null;

    super.dispose();
  }

  /// Returns the presentation outcome once visibility is known.
  Future<PresentationOutcome> enqueue(DynamicMessageContext context) {
    final completer = Completer<PresentationOutcome>();
    _complete(
      context.message,
      const PresentationOutcome.notShown(PresentationNotShownReason.cancelled),
    );
    _completers[context.message] = completer;

    pending.remove(context);
    pending.add(context);

    _checkQueue();

    return completer.future;
  }

  void _checkQueue() {
    if (_suppressed) {
      logger.info('[Presenter.checkQueue]: Suppressed, skipping queue check');
      return;
    }

    if (active != null) {
      logger.info(
          '[Presenter.checkQueue]: Has active message, skipping queue check');
      return;
    }

    if (pending.isEmpty) {
      logger
          .info('[Presenter.checkQueue]: Queue is empty, skipping queue check');
      return;
    }

    final tuple = pending.removeFirst();
    final message = tuple.message;

    final builder = widget.builders[tuple.message.type];
    if (builder == null) {
      logger.info(
          '[Presenter.checkQueue]: No builder found for ${message.type} type, skipping message');
      _complete(
        message,
        const PresentationOutcome.notShown(
          PresentationNotShownReason.missingHandle,
        ),
      );
      _checkQueue();
      return;
    }

    _active = builder(tuple);
    unawaited(_present(_active!));
  }

  Future<void> _present(DynamicMessageHandle handle) async {
    PresentationAttempt attempt;
    try {
      attempt = await Future.value(
        handle.present(context, widget.navigatorKey?.currentState),
      );
    } catch (error, stackTrace) {
      logger.warning(
        'Message(${handle.context.message.id}) presentation failed',
        error,
        stackTrace,
      );
      _complete(
        handle.context.message,
        const PresentationOutcome.notShown(PresentationNotShownReason.failed),
      );
      _finish(handle);
      return;
    }

    if (!mounted) {
      _complete(
        handle.context.message,
        const PresentationOutcome.notShown(
            PresentationNotShownReason.cancelled),
      );
      _finish(handle);
      return;
    }

    switch (attempt) {
      case PresentationShownAttempt(:final session):
        logger.info('Message(${handle.context.message.id}) shown');
        _complete(handle.context.message, attempt.outcome);
        await _waitForCompletion(handle, session);
      case PresentationNotShownAttempt(:final reason):
        logger.info(
          'Message(${handle.context.message.id}) not shown: ${reason.name}',
        );
        _complete(handle.context.message, attempt.outcome);
        _finish(handle);
    }
  }

  Future<void> _waitForCompletion(
    DynamicMessageHandle handle,
    PresentationSession session,
  ) async {
    try {
      await session.completed;
      logger.info('Message(${handle.context.message.id}) closed');
    } catch (error, stackTrace) {
      logger.warning(
        'Message(${handle.context.message.id}) completion failed',
        error,
        stackTrace,
      );
    } finally {
      _finish(handle);
    }
  }

  void _finish(DynamicMessageHandle handle) {
    if (_active != handle) return;

    _active = null;
    if (mounted) {
      _checkQueue();
    }
  }

  void _complete(DynamicMessage message, PresentationOutcome outcome) {
    final completer = _completers.remove(message);
    if (completer == null || completer.isCompleted) return;

    completer.complete(outcome);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
