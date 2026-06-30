import 'dart:convert';

import 'package:in_app_messaging/in_app_messaging.dart';
import 'package:test/test.dart';

import 'helpers/test_messages.dart';

void main() {
  group('entity serialization', () {
    test('MessageType round-trips through JSON', () {
      const value = MessageType(name: 'dialog');

      expect(MessageType.fromJson(value.toJson()), value);
    });

    test('MessageSlot round-trips through JSON', () {
      const value = MessageSlot(id: 'home');

      expect(MessageSlot.fromJson(value.toJson()), value);
    });

    test('DeviceContext parses snake_case version number', () {
      final context = DeviceContext.fromJson({
        'platform': 'android',
        'version': '1.2.3',
        'version_number': '123',
        'language': 'en',
      });

      expect(context.versionNumber, '123');
      expect(context.getByKey('platform'), 'android');
    });

    test('UserContext preserves unknown string properties as extra', () {
      final context = UserContext.fromJson({
        'id': 'user-1',
        'plan': 'pro',
        'ignored': 1,
      });

      expect(context.id, 'user-1');
      expect(context.getByKey('plan'), 'pro');
      expect(context.extra, {'id': 'user-1', 'plan': 'pro'});
    });

    test('MessageSeenEntry uses trigger_properties JSON key', () {
      final entry = MessageSeenEntry(
        date: DateTime.utc(2026, 1, 2, 3, 4, 5),
        trigger: 'checkout',
        triggerProperties: {'order_id': '42'},
      );

      final json = entry.toJson();
      final parsed = MessageSeenEntry.fromJson(json);

      expect(json['trigger_properties'], {'order_id': '42'});
      expect(parsed, entry);
    });

    test('MessageInteractions round-trips through encoded JSON', () {
      final value = MessageInteractions(
        message: 'message',
        seenEntries: [
          MessageSeenEntry(
            date: DateTime.utc(2026),
            trigger: 'event',
            triggerProperties: {'id': '1'},
          ),
        ],
      );

      final json = jsonDecode(jsonEncode(value.toJson()));

      expect(MessageInteractions.fromJson(json), value);
    });

    test('MessageTrigger event contains runtime trigger with extra payload',
        () {
      const configured = MessageTrigger.event(
        event: 'checkout',
        data: {'id': '1'},
      );
      const runtime = MessageTrigger.event(
        event: 'checkout',
        data: {
          'id': '1',
          'source': 'button',
        },
      );

      expect(runtime.contains(configured), isTrue);
    });

    test('MessageTrigger variants round-trip through encoded JSON', () {
      const triggers = [
        MessageTrigger.cron(cron: '* * * * *', event: 'tick'),
        MessageTrigger.event(event: 'checkout', data: {'id': '1'}),
        MessageTrigger.eventSequence(
          events: [
            EventSequenceItem(name: 'first'),
            EventSequenceItem(name: 'second', maxDelay: 2),
          ],
          data: [
            null,
            {'id': '1'},
          ],
        ),
      ];

      final parsed = triggers.map((trigger) {
        final json = jsonDecode(jsonEncode(trigger.toJson()));
        return MessageTrigger.fromJson(json);
      });

      expect(parsed, triggers);
    });

    test('EventSequenceItemStringConverter parses compact syntax', () {
      final converter = EventSequenceItemStringConverter();

      final item = converter.fromJson('!checkout_closed(2.5s)');

      expect(item.name, 'checkout_closed');
      expect(item.expected, isFalse);
      expect(item.maxDelay, 2.5);
      expect(converter.toJson(item), '!checkout_closed(2.5s)');
    });

    test('SimpleMessage round-trips through encoded JSON', () {
      final message = testMessage(
        id: 'message',
        data: {'title': 'Title'},
        condition: OnceCondition().asJsonLogic(),
      );

      final json = jsonDecode(jsonEncode(message.toJson()));

      expect(SimpleMessage.fromJson(json), message);
    });
  });
}
