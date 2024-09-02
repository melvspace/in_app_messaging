import 'package:checks/checks.dart';
import 'package:in_app_messaging/in_app_messaging.dart';
import 'package:test/test.dart';

void main() {
  test(
    skip: 'not implemented',
    'test event sequence',
    () {
      InAppMessaging.initialize(
        gateway: DefaultMessageGateway(
          messageSource: MemoryMessageSource(messages: [
            SimpleMessage(
              id: 'id',
              enabled: true,
              type: const MessageType(name: 'type'),
              start: DateTime.now(),
              end: null,
              triggers: [
                const MessageTrigger.eventSequence(
                  events: [
                    EventSequenceItem(name: 'event_1'),
                    EventSequenceItem(name: 'event_2'),
                  ],
                  data: [null, null],
                ),
              ],
              condition: OnceCondition().asJsonLogic(),
              data: {},
            ),
          ]),
          interactionSource: MemoryInteractionSource(),
          contextSource: MemoryContextSource(
            context: {
              'device': {
                'platform': 'platform',
                'version': 'version',
                'versionNumber': 'versionNumber',
                'language': 'language',
              },
              "user": {}
            },
          ),
        ),
      );

      check(
        InAppMessaging.instance.trigger('event_1', {}),
      ).completes((it) => it.equals(false));

      check(
        InAppMessaging.instance.trigger('event_2', {}),
      ).completes((it) => it.equals(true));
    },
  );
}
