// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:in_app_messaging_drift/src/data/schema/in_app_message_seen_dates.drift.dart'
    as i1;
import 'package:in_app_messaging_drift/src/data/schema/in_app_message_interactions.drift.dart'
    as i2;
import 'package:in_app_messaging_drift/src/data/dao/in_app_messaging_dao.dart'
    as i3;
import 'package:in_app_messaging_drift/src/data/database/database.dart' as i4;

abstract class $InAppMessagingDatabase extends i0.GeneratedDatabase {
  $InAppMessagingDatabase(i0.QueryExecutor e) : super(e);
  $InAppMessagingDatabaseManager get managers =>
      $InAppMessagingDatabaseManager(this);
  late final i1.$InAppMessageSeenDatesTable inAppMessageSeenDates =
      i1.$InAppMessageSeenDatesTable(this);
  late final i2.$InAppMessageInteractionsTable inAppMessageInteractions =
      i2.$InAppMessageInteractionsTable(this);
  late final i3.InAppMessagingDao inAppMessagingDao =
      i3.InAppMessagingDao(this as i4.InAppMessagingDatabase);
  @override
  Iterable<i0.TableInfo<i0.Table, Object?>> get allTables =>
      allSchemaEntities.whereType<i0.TableInfo<i0.Table, Object?>>();
  @override
  List<i0.DatabaseSchemaEntity> get allSchemaEntities =>
      [inAppMessageSeenDates, inAppMessageInteractions];
}

class $InAppMessagingDatabaseManager {
  final $InAppMessagingDatabase _db;
  $InAppMessagingDatabaseManager(this._db);
  i1.$$InAppMessageSeenDatesTableTableManager get inAppMessageSeenDates => i1
      .$$InAppMessageSeenDatesTableTableManager(_db, _db.inAppMessageSeenDates);
  i2.$$InAppMessageInteractionsTableTableManager get inAppMessageInteractions =>
      i2.$$InAppMessageInteractionsTableTableManager(
          _db, _db.inAppMessageInteractions);
}
