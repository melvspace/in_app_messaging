import 'package:drift/drift.dart';
import 'package:in_app_messaging_drift/src/data/dao/in_app_messaging_dao.dart';
import 'package:in_app_messaging_drift/src/data/database/connection.dart';
import 'package:in_app_messaging_drift/src/data/database/database.drift.dart';
import 'package:in_app_messaging_drift/src/data/database/schema_versions.dart';
import 'package:in_app_messaging_drift/src/data/schema/schema.dart';

@DriftDatabase(
  tables: [InAppMessageSeenDates, InAppMessageInteractions],
  daos: [InAppMessagingDao],
)
class InAppMessagingDatabase extends $InAppMessagingDatabase {
  InAppMessagingDatabase({QueryExecutor? executor})
      : super(executor ?? openConnection('in_app_messaging', 'db'));

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (m) => m.createAll(),
      onUpgrade: (m, from, to) {
        if (to < from) {
          // TODO(@melvspace): 01/09/24 handle downgrade
        }

        return stepByStep(
          from0To1: (m, schema) async {},
        )(m, from, to);
      },
    );
  }
}
