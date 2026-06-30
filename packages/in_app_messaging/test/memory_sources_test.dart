import 'package:in_app_messaging/in_app_messaging.dart';
import 'package:test/test.dart';

import 'helpers/test_messages.dart';

void main() {
  group('MemoryInteractionSource', () {
    test('keeps seen entries isolated by message id', () async {
      final source = MemoryInteractionSource();

      source.markSeen(id: 'first');
      source.markSeen(id: 'second');
      source.markSeen(id: 'first');

      final first = await source.getInteractions('first');
      final second = await source.getInteractions('second');

      expect(first.seenEntries, hasLength(2));
      expect(second.seenEntries, hasLength(1));
    });

    test('persists trigger and trigger properties in seen entries', () async {
      final source = MemoryInteractionSource();

      source.markSeen(
        id: 'message',
        trigger: 'checkout',
        triggerProperties: {'order_id': '42'},
      );

      final interactions = await source.getInteractions('message');
      final entry = interactions.seenEntries.single;

      expect(entry.trigger, 'checkout');
      expect(entry.triggerProperties, {'order_id': '42'});
    });
  });

  group('MemoryContextSource', () {
    test('updates user and device branches', () {
      final source = MemoryContextSource(context: testContext());

      source.updateUserProperty('plan', 'pro');
      source.updateDeviceProperty('language', 'fr');

      expect(source.getUser().getByKey('plan'), 'pro');
      expect(source.getDevice().getByKey('language'), 'fr');
    });

    test('exposes read-only context view', () {
      final source = MemoryContextSource(context: testContext());

      expect(
        () => source.context['user'] = {'id': 'other'},
        throwsUnsupportedError,
      );
    });
  });

  group('MemoryMessageSource', () {
    test('returns configured message list by reference', () {
      final messages = [testMessage(id: 'message')];
      final source = MemoryMessageSource(messages: messages);

      expect(source.fetchMessages(), same(messages));
    });
  });
}
