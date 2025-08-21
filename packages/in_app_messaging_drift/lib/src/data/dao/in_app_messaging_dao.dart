import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:in_app_messaging/in_app_messaging.dart';
import 'package:in_app_messaging_drift/src/data/dao/in_app_messaging_dao.drift.dart';
import 'package:in_app_messaging_drift/src/data/database/database.dart';
import 'package:in_app_messaging_drift/src/data/schema/schema.dart';
import 'package:in_app_messaging_drift/src/in_app_messaging_drift_logger.dart';

@DriftAccessor(tables: [InAppMessageSeenDates, InAppMessageInteractions])
class InAppMessagingDao extends DatabaseAccessor<InAppMessagingDatabase>
    with $InAppMessagingDaoMixin {
  InAppMessagingDao(super.db);

  Future<List<MessageSeenEntry>> getSeenEntries(String id) async {
    final seenQuery = inAppMessageSeenDates.select() //
      ..where((tbl) => tbl.message.equals(id));

    final seenEntries = await seenQuery.get();

    return seenEntries
        .map(
          (e) => MessageSeenEntry(
            date: e.seen,
            trigger: e.trigger,
            triggerProperties: e.triggerProperties != null
                ? jsonDecode(e.triggerProperties!)
                : null,
          ),
        )
        .toList();
  }

  Future<void> interact<T>({
    required String id,
    required String key,
    required T data,
    required String trigger,
    required Map<String, dynamic> triggerProperties,
  }) async {
    final interactionQuery = inAppMessageInteractions.select() //
      ..where((tbl) => tbl.message.equals(id));

    final interactions = await interactionQuery.getSingleOrNull();
    final updated = InAppMessageInteractionsCompanion.insert(
      message: id,
      interactions: {
        ...?interactions?.interactions,
        key: data,
      },
    );

    await into(inAppMessageInteractions).insertOnConflictUpdate(updated);
  }

  Future<void> markSeen({
    required String id,
    String? trigger,
    Map<String, dynamic>? triggerProperties,
  }) async {
    String? sTriggerProperties;
    try {
      sTriggerProperties = jsonEncode(triggerProperties);
    } catch (e) {
      logger.info('failed to serialize trigger properties');
      sTriggerProperties = null;
    }

    final data = InAppMessageSeenDatesCompanion.insert(
      message: id,
      seen: DateTime.now(),
      trigger: Value(trigger),
      triggerProperties: Value(sTriggerProperties),
    );

    await into(inAppMessageSeenDates).insert(data);
  }
}
