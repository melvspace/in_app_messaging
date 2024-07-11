import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:in_app_messaging/in_app_messaging.dart';
import 'package:sandbox/features/iam/presentation/handles/dialog_message_handle/dialog_message_handle.dart';

part 'messages.g.dart';

@riverpod
List<Message> iamMessages(IamMessagesRef ref) {
  return [
    SimpleMessage(
      id: 'Cron Message',
      enabled: true,
      type: DialogMessageHandle.kType,
      start: DateTime.now(),
      end: null,
      triggers: [
        const MessageTrigger.cron(cron: '* * * * *'),
      ],
      condition: OnceCondition(),
      data: {
        'title': 'Cron Message',
      },
    ),
    SimpleMessage(
      id: 'Single Event Message',
      enabled: true,
      type: DialogMessageHandle.kType,
      start: DateTime.now(),
      end: null,
      triggers: [
        const MessageTrigger.event(event: 'message_event_1'),
      ],
      condition: OnceCondition(),
      data: {
        'title': 'Event Triggered Dialog',
        'body': 'event: message_event_1',
        'actions': [
          {
            'text': 'close',
            'click': {'type': 'pop'},
            'events': ['message_event_2'],
          }
        ]
      },
    ),
    SimpleMessage(
      id: 'Sequence Events Message',
      enabled: true,
      type: DialogMessageHandle.kType,
      start: DateTime.now(),
      end: null,
      triggers: [
        const MessageTrigger.eventSequence(
          events: [
            EventSequenceItem(name: 'message_event_1'),
            EventSequenceItem(name: 'message_event_2'),
          ],
          data: [{}, {}],
        ),
      ],
      condition: OnceCondition(),
      data: {
        'title': 'Dialog triggered by Sequence of events',
        'body': 'events: ${[
          const EventSequenceItem(name: 'message_event_1'),
          const EventSequenceItem(name: 'message_event_1_closed'),
        ].join(', ')}'
      },
    )
  ];
}
