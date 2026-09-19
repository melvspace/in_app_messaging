import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:in_app_messaging/in_app_messaging.dart';
import 'package:sandbox/features/iam/presentation/handles/transient_message_handle/transient_message_handle.dart';

void main() {
  testWidgets('presents and dismisses a material banner', (tester) async {
    final hostContext = await _pumpHost(tester);
    final handle = TransientMessageHandle(
      context: _messageContext(
        type: TransientMessageHandle.bannerType,
        data: const {
          'title': 'Free delivery is close',
          'body': 'Add one more item.',
          'actionLabel': 'Got it',
        },
      ),
    );

    final attemptFuture = handle.present(hostContext);
    await tester.pump();
    final attempt = await attemptFuture;
    await tester.pump(const Duration(milliseconds: 300));

    expect(attempt, isA<PresentationShownAttempt>());
    expect(find.text('Free delivery is close'), findsOneWidget);
    expect(find.text('Add one more item.'), findsOneWidget);

    await tester.tap(find.text('Got it'));
    await tester.pumpAndSettle();

    expect(find.text('Free delivery is close'), findsNothing);
  });

  testWidgets('presents and closes a snackbar notification', (tester) async {
    final hostContext = await _pumpHost(tester);
    final handle = TransientMessageHandle(
      context: _messageContext(
        type: TransientMessageHandle.notificationType,
        data: const {
          'title': 'Saved for later',
          'body': 'The item is in your favorites.',
        },
      ),
    );

    final attemptFuture = handle.present(hostContext);
    await tester.pump();
    final attempt = await attemptFuture;
    await tester.pump(const Duration(milliseconds: 300));

    expect(attempt, isA<PresentationShownAttempt>());
    expect(find.text('Saved for later'), findsOneWidget);
    expect(find.text('The item is in your favorites.'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.close));
    await tester.pumpAndSettle();

    expect(find.text('Saved for later'), findsNothing);
  });
}

Future<BuildContext> _pumpHost(WidgetTester tester) async {
  late BuildContext hostContext;
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: Builder(
          builder: (context) {
            hostContext = context;
            return const SizedBox.shrink();
          },
        ),
      ),
    ),
  );
  return hostContext;
}

DynamicMessageContext _messageContext({
  required MessageType type,
  required Map<String, dynamic> data,
}) {
  final message = SimpleMessage(
    id: 'message',
    enabled: true,
    type: type,
    start: DateTime(2026),
    triggers: const [MessageTrigger.event(event: 'event')],
    data: data,
  );

  return DynamicMessageContext(
    message: message,
    trigger: const MessageTrigger.event(event: 'event'),
    interactions: const MessageInteractions(
      message: 'message',
      seenEntries: [],
    ),
    context: const {
      'device': {
        'platform': 'android',
        'version': '1.0.0',
        'version_number': '1',
        'language': 'en',
      },
      'user': {},
    },
  );
}
