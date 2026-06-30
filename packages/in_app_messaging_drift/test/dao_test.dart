import 'dart:convert';

import 'package:drift/drift.dart' hide isNull;
import 'package:drift/native.dart';
import 'package:in_app_messaging_drift/in_app_messaging_drift.dart';
import 'package:test/test.dart';

void main() {
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;

  late InAppMessagingDatabase database;

  setUp(() {
    database = InAppMessagingDatabase(executor: NativeDatabase.memory());
  });

  tearDown(() async {
    await database.close();
  });

  group('InAppMessagingDao', () {
    test('markSeen stores trigger metadata and getSeenEntries decodes it',
        () async {
      await database.inAppMessagingDao.markSeen(
        id: 'message',
        trigger: 'checkout',
        triggerProperties: {'order_id': '42'},
      );

      final entries =
          await database.inAppMessagingDao.getSeenEntries('message');

      expect(entries, hasLength(1));
      expect(entries.single.trigger, 'checkout');
      expect(entries.single.triggerProperties, {'order_id': '42'});
    });

    test('markSeen records row when trigger properties are not serializable',
        () async {
      await database.inAppMessagingDao.markSeen(
        id: 'message',
        trigger: 'checkout',
        triggerProperties: {'bad': Object()},
      );

      final entries =
          await database.inAppMessagingDao.getSeenEntries('message');

      expect(entries, hasLength(1));
      expect(entries.single.trigger, 'checkout');
      expect(entries.single.triggerProperties, isNull);
    });

    test('getSeenEntries returns deterministic seen-date order', () async {
      await database.customStatement(
        'INSERT INTO in_app_message_seen_dates '
        '(message, seen, trigger) VALUES (?, ?, ?)',
        ['message', 2, 'late'],
      );
      await database.customStatement(
        'INSERT INTO in_app_message_seen_dates '
        '(message, seen, trigger) VALUES (?, ?, ?)',
        ['message', 1, 'early'],
      );

      final entries =
          await database.inAppMessagingDao.getSeenEntries('message');

      expect(entries.map((entry) => entry.trigger), ['early', 'late']);
    });

    test('getSeenEntries isolates message ids', () async {
      await database.inAppMessagingDao.markSeen(id: 'first');
      await database.inAppMessagingDao.markSeen(id: 'second');
      await database.inAppMessagingDao.markSeen(id: 'first');

      final first = await database.inAppMessagingDao.getSeenEntries('first');
      final second = await database.inAppMessagingDao.getSeenEntries('second');

      expect(first, hasLength(2));
      expect(second, hasLength(1));
    });

    test('interact upserts and merges aggregate interaction keys', () async {
      await database.inAppMessagingDao.interact(
        id: 'message',
        key: 'dismissed',
        data: true,
        trigger: 'event',
        triggerProperties: const {},
      );
      await database.inAppMessagingDao.interact(
        id: 'message',
        key: 'count',
        data: 2,
        trigger: 'event',
        triggerProperties: const {},
      );

      final row = await database.customSelect(
        'SELECT interactions FROM in_app_message_interactions '
        'WHERE message = ?',
        variables: [Variable.withString('message')],
      ).getSingle();

      expect(
        jsonDecode(row.read<String>('interactions')),
        {'dismissed': true, 'count': 2},
      );
    });
  });

  group('DriftInteractionSource', () {
    test('maps DAO rows to MessageInteractions', () async {
      final source = DriftInteractionSource(
        dao: database.inAppMessagingDao,
      );

      await source.markSeen(
        id: 'message',
        trigger: 'event',
        triggerProperties: {'id': '1'},
      );

      final interactions = await source.getInteractions('message');

      expect(interactions.message, 'message');
      expect(interactions.seenEntries, hasLength(1));
      expect(interactions.seenEntries.single.triggerProperties, {'id': '1'});
    });
  });
}
