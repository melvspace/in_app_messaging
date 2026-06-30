import 'dart:convert';

import 'package:in_app_messaging/in_app_messaging.dart';
import 'package:test/test.dart';

void main() {
  group('MessageTrigger', () {
    test('event trigger allows runtime payload supersets', () {
      const configured = MessageTrigger.event(
        event: 'purchase',
        data: {'sku': 'pro'},
      );
      const runtime = MessageTrigger.event(
        event: 'purchase',
        data: {'sku': 'pro', 'source': 'paywall'},
      );

      expect(runtime.contains(configured), isTrue);
    });

    test('event trigger rejects different payload values', () {
      const configured = MessageTrigger.event(
        event: 'purchase',
        data: {'sku': 'pro'},
      );
      const runtime = MessageTrigger.event(
        event: 'purchase',
        data: {'sku': 'free'},
      );

      expect(runtime.contains(configured), isFalse);
    });

    test('experimental trigger variants only have serialization smoke coverage',
        () {
      const triggers = [
        MessageTrigger.cron(cron: '* * * * *', event: 'tick'),
        MessageTrigger.eventSequence(
          events: [
            EventSequenceItem(name: 'first'),
            EventSequenceItem(name: 'second', maxDelay: 1),
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
      }).toList();

      expect(parsed, triggers);
    });
  });
}
