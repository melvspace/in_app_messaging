import 'package:drift/drift.dart';
import 'package:in_app_messaging_drift/src/data/dao/in_app_messaging_dao.drift.dart';
import 'package:in_app_messaging_drift/src/data/database/database.dart';
import 'package:in_app_messaging_drift/src/data/schema/schema.dart';

typedef InteractionsTuple = ({
  Map<String, dynamic> additional,
  List<DateTime> seenDates,
});

@DriftAccessor(tables: [InAppMessageSeenDates, InAppMessageInteractions])
class InAppMessagingDao extends DatabaseAccessor<InAppMessagingDatabase>
    with $InAppMessagingDaoMixin {
  InAppMessagingDao(super.db);

  Future<InteractionsTuple> getInteractions(String id) async {
    final seenQuery = inAppMessageSeenDates.select() //
      ..where((tbl) => tbl.message.equals(id));
    final interactionQuery = inAppMessageInteractions.select() //
      ..where((tbl) => tbl.message.equals(id));

    final seenDates = await seenQuery
        .get()
        .then((value) => value.map((e) => e.seen).toList());
    final interactions = await interactionQuery.getSingleOrNull();

    return (
      seenDates: seenDates,
      additional: interactions?.interactions ?? {},
    );
  }

  Future<void> interact<T>(String id, String key, T data) async {
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

  Future<void> markSeen(String id) async {
    final data = InAppMessageSeenDatesCompanion.insert(
      message: id,
      seen: DateTime.now(),
    );

    await into(inAppMessageSeenDates).insert(data);
  }
}
