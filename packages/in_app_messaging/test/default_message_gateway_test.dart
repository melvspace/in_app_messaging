import 'dart:async';

import 'package:in_app_messaging/in_app_messaging.dart';
import 'package:test/test.dart';

import 'helpers/test_messages.dart';

void main() {
  group('DefaultMessageGateway', () {
    test('returns null when event does not match', () async {
      final gateway = _gateway([
        testMessage(id: 'message'),
      ]);

      final result = await gateway.evaluate('other_event', {});

      expect(result, isNull);
    });

    test('matches configured trigger payload as subset of runtime payload',
        () async {
      final gateway = _gateway([
        testMessage(
          id: 'message',
          triggers: const [
            MessageTrigger.event(event: 'event', data: {'id': '1'}),
          ],
        ),
      ]);

      final result = await gateway.evaluate('event', {
        'id': '1',
        'source': 'button',
      });

      expect(result?.message.id, 'message');
    });

    test('rejects event payload when configured subset differs', () async {
      final gateway = _gateway([
        testMessage(
          id: 'message',
          triggers: const [
            MessageTrigger.event(event: 'event', data: {'id': '1'}),
          ],
        ),
      ]);

      final result = await gateway.evaluate('event', {'id': '2'});

      expect(result, isNull);
    });

    test('skips disabled messages', () async {
      final gateway = _gateway([
        testMessage(id: 'disabled', enabled: false, priority: 0),
        testMessage(id: 'enabled', priority: 1),
      ]);

      final result = await gateway.evaluate('event', {});

      expect(result?.message.id, 'enabled');
    });

    test('filters by start and end window', () async {
      final now = DateTime.now();
      final gateway = _gateway([
        testMessage(
          id: 'future',
          start: now.add(const Duration(minutes: 1)),
          priority: 0,
        ),
        testMessage(
          id: 'ended',
          start: now.subtract(const Duration(hours: 2)),
          end: now.subtract(const Duration(hours: 1)),
          priority: 1,
        ),
        testMessage(
          id: 'active',
          start: now.subtract(const Duration(minutes: 1)),
          end: now.add(const Duration(minutes: 1)),
          priority: 2,
        ),
      ]);

      final result = await gateway.evaluate('event', {});

      expect(result?.message.id, 'active');
    });

    test('null condition is eligible', () async {
      final gateway = _gateway([
        testMessage(id: 'message', condition: null),
      ]);

      final result = await gateway.evaluate('event', {});

      expect(result?.message.id, 'message');
    });

    test('builds condition context from event, context, and interactions',
        () async {
      final interactions = MemoryInteractionSource();
      interactions.markSeen(
        id: 'message',
        trigger: 'event',
        triggerProperties: {'plan': 'pro'},
      );
      final gateway = _gateway(
        [
          testMessage(
            id: 'message',
            condition: {
              'and': [
                {
                  '==': [
                    {'var': 'event.event_name'},
                    'event',
                  ],
                },
                {
                  '==': [
                    {'var': 'event.plan'},
                    'pro',
                  ],
                },
                {
                  '==': [
                    {'var': 'device.platform'},
                    'android',
                  ],
                },
                {
                  '==': [
                    {'var': 'user.id'},
                    'user-1',
                  ],
                },
                {
                  '==': [
                    {'var': 'interactions.last_seen.trigger'},
                    'event',
                  ],
                },
                {
                  '==': [
                    {
                      'var': 'interactions.last_seen.trigger_properties.plan',
                    },
                    'pro',
                  ],
                },
              ],
            },
          ),
        ],
        interactionSource: interactions,
      );

      final result = await gateway.evaluate('event', {'plan': 'pro'});

      expect(result?.message.id, 'message');
    });

    test('selects lowest numeric priority when multiple messages match',
        () async {
      final gateway = _gateway([
        testMessage(id: 'later', priority: 20),
        testMessage(id: 'first', priority: 10),
      ]);

      final result = await gateway.evaluate('event', {});

      expect(result?.message.id, 'first');
    });

    test('returns one selected message per event', () async {
      final gateway = _gateway([
        testMessage(id: 'first', priority: 0),
        testMessage(id: 'second', priority: 1),
      ]);

      final result = await gateway.evaluate('event', {});

      expect(result?.message.id, 'first');
    });

    test('caches message source results', () async {
      final source = _CountingMessageSource([
        testMessage(id: 'message'),
      ]);
      final gateway = DefaultMessageGateway(
        messageSource: source,
        interactionSource: MemoryInteractionSource(),
        contextSource: MemoryContextSource(context: testContext()),
      );

      await gateway.evaluate('event', {});
      await gateway.evaluate('event', {});

      expect(source.fetchCount, 1);
    });

    test('markSeen forwards trigger data to interaction source', () async {
      final interactions = MemoryInteractionSource();
      final gateway = _gateway(
        [testMessage(id: 'message')],
        interactionSource: interactions,
      );

      await gateway.markSeen(
        id: 'message',
        trigger: 'event',
        triggerProperties: {'id': '1'},
      );

      final result = await gateway.getInteractions('message');
      expect(result.seenEntries, hasLength(1));
      expect(result.seenEntries.single.trigger, 'event');
      expect(result.seenEntries.single.triggerProperties, {'id': '1'});
    });
  });
}

DefaultMessageGateway _gateway(
  List<Message> messages, {
  InteractionSource? interactionSource,
}) {
  return DefaultMessageGateway(
    messageSource: MemoryMessageSource(messages: messages),
    interactionSource: interactionSource ?? MemoryInteractionSource(),
    contextSource: MemoryContextSource(context: testContext()),
  );
}

class _CountingMessageSource implements MessageSource {
  _CountingMessageSource(this.messages);

  final List<Message> messages;
  int fetchCount = 0;

  @override
  FutureOr<List<Message>> fetchMessages() {
    fetchCount++;
    return messages;
  }
}
