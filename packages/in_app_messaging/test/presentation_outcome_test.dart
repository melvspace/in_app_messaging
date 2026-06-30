import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:in_app_messaging/in_app_messaging.dart';

void main() {
  group('presentation outcome', () {
    testWidgets('shown outcome records seen immediately', (tester) async {
      final completion = Completer<void>();
      final gateway = _Gateway([_context('message')]);

      await _pumpPresenter(
        tester,
        gateway: gateway,
        builders: {
          _type: (context) => _ShownHandle(
                context: context,
                completed: completion.future,
              ),
        },
      );

      final trigger = InAppMessaging.instance.trigger('event', {});
      await tester.pump();

      expect(await trigger, isTrue);
      expect(gateway.markedSeen, ['message']);
      expect(completion.isCompleted, isFalse);

      completion.complete();
      await tester.pump();
    });

    testWidgets('shown session blocks next message until completion',
        (tester) async {
      final firstCompletion = Completer<void>();
      final secondCompletion = Completer<void>();
      final shown = <String>[];
      final gateway = _Gateway([
        _context('first'),
        _context('second'),
      ]);

      await _pumpPresenter(
        tester,
        gateway: gateway,
        builders: {
          _type: (context) {
            final id = context.message.id;
            return _ShownHandle(
              context: context,
              completed: id == 'first'
                  ? firstCompletion.future
                  : secondCompletion.future,
              onPresent: () => shown.add(id),
            );
          },
        },
      );

      final first = InAppMessaging.instance.trigger('event', {});
      await tester.pump();
      expect(await first, isTrue);
      expect(shown, ['first']);

      final second = InAppMessaging.instance.trigger('event', {});
      await tester.pump();
      expect(shown, ['first']);

      firstCompletion.complete();
      await tester.pump();
      expect(shown, ['first', 'second']);
      expect(await second, isTrue);

      secondCompletion.complete();
      await tester.pump();
    });

    testWidgets('session completion error still advances queue',
        (tester) async {
      final firstCompletion = Completer<void>();
      final secondCompletion = Completer<void>();
      final shown = <String>[];
      final gateway = _Gateway([
        _context('first'),
        _context('second'),
      ]);

      await _pumpPresenter(
        tester,
        gateway: gateway,
        builders: {
          _type: (context) {
            final id = context.message.id;
            return _ShownHandle(
              context: context,
              completed: id == 'first'
                  ? firstCompletion.future
                  : secondCompletion.future,
              onPresent: () => shown.add(id),
            );
          },
        },
      );

      final first = InAppMessaging.instance.trigger('event', {});
      await tester.pump();
      expect(await first, isTrue);

      final second = InAppMessaging.instance.trigger('event', {});
      await tester.pump();
      expect(shown, ['first']);

      firstCompletion.completeError(StateError('completion failed'));
      await tester.pump();
      expect(shown, ['first', 'second']);
      expect(await second, isTrue);
      expect(gateway.markedSeen, ['first', 'second']);

      secondCompletion.complete();
      await tester.pump();
    });

    testWidgets('not shown outcome does not record seen and advances queue',
        (tester) async {
      final shown = <String>[];
      final gateway = _Gateway([
        _context('declined'),
        _context('shown'),
      ]);

      await _pumpPresenter(
        tester,
        gateway: gateway,
        builders: {
          _type: (context) {
            if (context.message.id == 'declined') {
              return _NotShownHandle(
                context: context,
                reason: PresentationNotShownReason.declined,
              );
            }

            return _ShownHandle(
              context: context,
              onPresent: () => shown.add(context.message.id),
            );
          },
        },
      );

      final declined = InAppMessaging.instance.trigger('event', {});
      await tester.pump();
      expect(await declined, isFalse);
      expect(gateway.markedSeen, isEmpty);

      final shownResult = InAppMessaging.instance.trigger('event', {});
      await tester.pump();
      expect(await shownResult, isTrue);
      expect(shown, ['shown']);
      expect(gateway.markedSeen, ['shown']);
    });

    testWidgets('missing handle does not record seen', (tester) async {
      final gateway = _Gateway([_context('missing')]);

      await _pumpPresenter(
        tester,
        gateway: gateway,
        builders: {},
      );

      final trigger = InAppMessaging.instance.trigger('event', {});
      await tester.pump();

      expect(await trigger, isFalse);
      expect(gateway.markedSeen, isEmpty);
    });

    testWidgets('throwing handle does not record seen and advances queue',
        (tester) async {
      final shown = <String>[];
      final gateway = _Gateway([
        _context('failed'),
        _context('shown'),
      ]);

      await _pumpPresenter(
        tester,
        gateway: gateway,
        builders: {
          _type: (context) {
            if (context.message.id == 'failed') {
              return _ThrowingHandle(context: context);
            }

            return _ShownHandle(
              context: context,
              onPresent: () => shown.add(context.message.id),
            );
          },
        },
      );

      final failed = InAppMessaging.instance.trigger('event', {});
      await tester.pump();
      expect(await failed, isFalse);
      expect(gateway.markedSeen, isEmpty);

      final shownResult = InAppMessaging.instance.trigger('event', {});
      await tester.pump();
      expect(await shownResult, isTrue);
      expect(shown, ['shown']);
      expect(gateway.markedSeen, ['shown']);
    });

    testWidgets('duplicate pending message cancels superseded result',
        (tester) async {
      final gateway = _Gateway([
        _context('same'),
        _context('same'),
      ]);

      await _pumpPresenter(
        tester,
        gateway: gateway,
        builders: {
          _type: (context) => _ShownHandle(context: context),
        },
        initiallySuppressed: true,
      );

      final first = InAppMessaging.instance.trigger('event', {});
      await tester.pump();

      final second = InAppMessaging.instance.trigger('event', {});
      await tester.pump();

      expect(await first, isFalse);
      expect(gateway.markedSeen, isEmpty);

      InAppMessaging.instance.setSuppressed(false);
      await tester.pump();

      expect(await second, isTrue);
      expect(gateway.markedSeen, ['same']);
    });

    testWidgets('dispose cancels pending result', (tester) async {
      final gateway = _Gateway([_context('pending')]);

      await _pumpPresenter(
        tester,
        gateway: gateway,
        builders: {
          _type: (context) => _ShownHandle(context: context),
        },
        initiallySuppressed: true,
      );

      final trigger = InAppMessaging.instance.trigger('event', {});
      await tester.pump();

      await tester.pumpWidget(const SizedBox.shrink());
      await tester.pump();

      expect(await trigger, isFalse);
      expect(gateway.markedSeen, isEmpty);
    });
  });
}

const _type = MessageType(name: 'test');

Future<void> _pumpPresenter(
  WidgetTester tester, {
  required MessageGateway gateway,
  required DynamicMessageHandleFactories builders,
  bool initiallySuppressed = false,
}) async {
  InAppMessaging.initialize(gateway: gateway);
  await tester.pumpWidget(
    Directionality(
      textDirection: TextDirection.ltr,
      child: DynamicMessagePresenter(
        builders: builders,
        initiallySuppressed: initiallySuppressed,
        child: const SizedBox.shrink(),
      ),
    ),
  );
}

DynamicMessageContext _context(String id) {
  return DynamicMessageContext(
    message: SimpleMessage(
      id: id,
      enabled: true,
      type: _type,
      start: DateTime(2026),
      triggers: const [MessageTrigger.event(event: 'event')],
      data: {},
    ),
    trigger: const MessageTrigger.event(event: 'event'),
    interactions: MessageInteractions(message: id, seenEntries: const []),
    context: const {
      'device': {
        'platform': 'test',
        'version': '1.0.0',
        'version_number': '1',
        'language': 'en',
      },
      'user': {},
    },
  );
}

class _Gateway implements MessageGateway {
  _Gateway(this._contexts);

  final List<DynamicMessageContext> _contexts;
  final List<String> markedSeen = [];

  @override
  FutureOr<DynamicMessageContext?> evaluate(
    String event,
    Map<String, dynamic> properties,
  ) {
    if (_contexts.isEmpty) return null;

    return _contexts.removeAt(0);
  }

  @override
  FutureOr<void> markSeen({
    required String id,
    String? trigger,
    Map<String, dynamic>? triggerProperties,
  }) {
    markedSeen.add(id);
  }

  @override
  FutureOr<void> setDeviceProperty(String key, String? value) {}

  @override
  FutureOr<void> setUserProperty(String key, String? value) {}
}

class _ShownHandle extends DynamicMessageHandle {
  _ShownHandle({
    required super.context,
    Future<void>? completed,
    void Function()? onPresent,
  })  : completed = completed ?? Future<void>.value(),
        _onPresent = onPresent;

  final Future<void> completed;
  final void Function()? _onPresent;

  @override
  PresentationAttempt present(
    BuildContext context, [
    NavigatorState? navigator,
  ]) {
    _onPresent?.call();
    return PresentationAttempt.shown(
      session: PresentationSession(completed: completed),
    );
  }
}

class _NotShownHandle extends DynamicMessageHandle {
  _NotShownHandle({
    required super.context,
    required this.reason,
  });

  final PresentationNotShownReason reason;

  @override
  PresentationAttempt present(
    BuildContext context, [
    NavigatorState? navigator,
  ]) {
    return PresentationAttempt.notShown(reason);
  }
}

class _ThrowingHandle extends DynamicMessageHandle {
  _ThrowingHandle({required super.context});

  @override
  PresentationAttempt present(
    BuildContext context, [
    NavigatorState? navigator,
  ]) {
    throw StateError('presentation failed');
  }
}
