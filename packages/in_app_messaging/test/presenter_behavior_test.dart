import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:in_app_messaging/in_app_messaging.dart';

import 'helpers/test_messages.dart';

void main() {
  group('DynamicMessagePresenter suppression', () {
    testWidgets('waits for all suppression keys to clear', (tester) async {
      final shown = <String>[];
      final gateway = _QueueGateway([_context('message')]);
      await _pumpPresenter(
        tester,
        gateway: gateway,
        builders: {
          testMessageType: (context) => _ShownHandle(
                context: context,
                onPresent: () => shown.add(context.message.id),
              ),
        },
      );

      InAppMessaging.instance.setSuppressed(true, key: 'route');
      InAppMessaging.instance.setSuppressed(true, key: 'modal');
      final trigger = InAppMessaging.instance.trigger('event', {});
      await tester.pump();
      expect(shown, isEmpty);

      InAppMessaging.instance.setSuppressed(false, key: 'route');
      await tester.pump();
      expect(shown, isEmpty);

      InAppMessaging.instance.setSuppressed(false, key: 'modal');
      await tester.pump();

      expect(await trigger, isTrue);
      expect(shown, ['message']);
    });

    testWidgets('delays unsuppression by buffer duration', (tester) async {
      final shown = <String>[];
      final gateway = _QueueGateway([_context('message')]);
      await _pumpPresenter(
        tester,
        gateway: gateway,
        initiallySuppressed: true,
        builders: {
          testMessageType: (context) => _ShownHandle(
                context: context,
                onPresent: () => shown.add(context.message.id),
              ),
        },
      );

      final trigger = InAppMessaging.instance.trigger('event', {});
      await tester.pump();

      InAppMessaging.instance.setSuppressed(
        false,
        bufferDuration: const Duration(milliseconds: 100),
      );
      await tester.pump(const Duration(milliseconds: 99));
      expect(shown, isEmpty);

      await tester.pump(const Duration(milliseconds: 1));

      expect(await trigger, isTrue);
      expect(shown, ['message']);
    });

    testWidgets('resuppressing cancels pending unsuppression timer',
        (tester) async {
      final shown = <String>[];
      final gateway = _QueueGateway([_context('message')]);
      await _pumpPresenter(
        tester,
        gateway: gateway,
        initiallySuppressed: true,
        builders: {
          testMessageType: (context) => _ShownHandle(
                context: context,
                onPresent: () => shown.add(context.message.id),
              ),
        },
      );

      final trigger = InAppMessaging.instance.trigger('event', {});
      await tester.pump();

      InAppMessaging.instance.setSuppressed(
        false,
        bufferDuration: const Duration(milliseconds: 100),
      );
      await tester.pump(const Duration(milliseconds: 50));
      InAppMessaging.instance.setSuppressed(true);
      await tester.pump(const Duration(milliseconds: 100));
      expect(shown, isEmpty);

      InAppMessaging.instance.setSuppressed(false);
      await tester.pump();

      expect(await trigger, isTrue);
      expect(shown, ['message']);
    });
  });

  group('DynamicMessagePresenter routing', () {
    testWidgets('forwards navigator state to handle', (tester) async {
      final navigatorKey = GlobalKey<NavigatorState>();
      NavigatorState? receivedNavigator;
      final gateway = _QueueGateway([_context('message')]);

      await _pumpPresenter(
        tester,
        gateway: gateway,
        navigatorKey: navigatorKey,
        child: MaterialApp(
          navigatorKey: navigatorKey,
          home: const SizedBox.shrink(),
        ),
        builders: {
          testMessageType: (context) => _NavigatorHandle(
                context: context,
                onPresent: (navigator) => receivedNavigator = navigator,
              ),
        },
      );

      expect(await InAppMessaging.instance.trigger('event', {}), isTrue);
      await tester.pump();

      expect(receivedNavigator, same(navigatorKey.currentState));
    });
  });

  group('InAppMessaging facade', () {
    testWidgets('returns false when gateway selects no message',
        (tester) async {
      final gateway = _QueueGateway([]);
      await _pumpPresenter(
        tester,
        gateway: gateway,
        initialize: false,
        builders: {
          testMessageType: (context) => _ShownHandle(context: context),
        },
      );

      expect(await InAppMessaging.instance.trigger('event', {}), isFalse);
      expect(gateway.markedSeen, isEmpty);
    });

    testWidgets('suppressor blocks while mounted and releases after buffer',
        (tester) async {
      final shown = <String>[];
      final mounted = ValueNotifier(true);
      addTearDown(mounted.dispose);
      final gateway = _QueueGateway([_context('message')]);
      await _pumpPresenter(
        tester,
        gateway: gateway,
        child: ValueListenableBuilder<bool>(
          valueListenable: mounted,
          builder: (context, isMounted, child) {
            if (!isMounted) return const SizedBox.shrink();

            return const InAppMessagingSuppressor(
              child: SizedBox.shrink(),
            );
          },
        ),
        builders: {
          testMessageType: (context) => _ShownHandle(
                context: context,
                onPresent: () => shown.add(context.message.id),
              ),
        },
      );

      final trigger = InAppMessaging.instance.trigger('event', {});
      await tester.pump();
      expect(shown, isEmpty);

      mounted.value = false;
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 999));
      expect(shown, isEmpty);

      await tester.pump(const Duration(milliseconds: 1));

      expect(await trigger, isTrue);
      expect(shown, ['message']);
    });
  });
}

Future<void> _pumpPresenter(
  WidgetTester tester, {
  required MessageGateway gateway,
  required DynamicMessageHandleFactories builders,
  Widget child = const SizedBox.shrink(),
  bool initiallySuppressed = false,
  GlobalKey<NavigatorState>? navigatorKey,
  bool initialize = true,
}) async {
  if (initialize) {
    InAppMessaging.initialize(gateway: gateway);
  }
  await tester.pumpWidget(
    Directionality(
      textDirection: TextDirection.ltr,
      child: DynamicMessagePresenter(
        builders: builders,
        initiallySuppressed: initiallySuppressed,
        navigatorKey: navigatorKey,
        child: child,
      ),
    ),
  );
}

DynamicMessageContext _context(String id) {
  return DynamicMessageContext(
    message: testMessage(id: id),
    trigger: const MessageTrigger.event(event: 'event'),
    interactions: MessageInteractions(message: id, seenEntries: const []),
    context: testContext(),
  );
}

class _QueueGateway implements MessageGateway {
  _QueueGateway(this._contexts);

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
}

class _ShownHandle extends DynamicMessageHandle {
  _ShownHandle({
    required super.context,
    this.onPresent,
  });

  final VoidCallback? onPresent;

  @override
  PresentationAttempt present(
    BuildContext context, [
    NavigatorState? navigator,
  ]) {
    onPresent?.call();
    return PresentationAttempt.shown();
  }
}

class _NavigatorHandle extends DynamicMessageHandle {
  _NavigatorHandle({
    required super.context,
    required this.onPresent,
  });

  final void Function(NavigatorState? navigator) onPresent;

  @override
  PresentationAttempt present(
    BuildContext context, [
    NavigatorState? navigator,
  ]) {
    onPresent(navigator);
    return PresentationAttempt.shown();
  }
}
