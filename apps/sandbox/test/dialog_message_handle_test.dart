import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:in_app_messaging/in_app_messaging.dart';
import 'package:sandbox/features/iam/presentation/handles/dialog_message_handle/dialog_message_data.dart';
import 'package:sandbox/features/iam/presentation/handles/dialog_message_handle/dialog_message_handle.dart';

void main() {
  test('DialogMessageData parses defaults and click action', () {
    final data = DialogMessageData.fromJson({
      'title': 'Title',
      'actions': [
        {
          'text': 'Close',
          'click': <String, dynamic>{},
          'events': ['closed'],
        },
      ],
    });

    expect(data.body, isNull);
    expect(data.actions, hasLength(1));
    expect(data.actions.single.click, isA<DialogPopClickAction>());
    expect(data.actions.single.events, ['closed']);
  });

  testWidgets('DialogMessageHandle shows and closes a dialog', (tester) async {
    BuildContext? hostContext;
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            hostContext = context;
            return const SizedBox.shrink();
          },
        ),
      ),
    );

    final handle = DialogMessageHandle(
      context: _messageContext({
        'title': 'Hello',
        'body': 'Body',
        'actions': [
          {
            'text': 'Close',
            'click': <String, dynamic>{},
          },
        ],
      }),
    );

    final attempt = handle.present(hostContext!);
    await tester.pump();
    await tester.pump();

    expect(await attempt, isA<PresentationShownAttempt>());
    expect(find.text('Hello'), findsOneWidget);
    expect(find.text('Body'), findsOneWidget);

    await tester.tap(find.text('Close'));
    await tester.pumpAndSettle();

    expect(find.text('Hello'), findsNothing);
  });
}

DynamicMessageContext _messageContext(Map<String, dynamic> data) {
  const type = DialogMessageHandle.kType;
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
