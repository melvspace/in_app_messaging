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
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (m) => m.createAll(),
      onUpgrade: (m, from, to) async {
        if (to < from) {
          await _reset(m);
          return;
        }

        return stepByStep(
          from0To1: (m, schema) async {},
          from1To2: (m, schema) async {
            await m.addColumn(
              inAppMessageSeenDates,
              inAppMessageSeenDates.trigger,
            );
            await m.addColumn(
              inAppMessageSeenDates,
              inAppMessageSeenDates.triggerProperties,
            );
          },
        )(m, from, to);
      },
    );
  }

  Future<void> _reset(Migrator m) async {
    final entities = await m.database
        .customSelect(
          "select name, type from sqlite_master where type in ('table', 'index', 'view', 'trigger');",
        )
        .get();

    for (final entity in entities) {
      final name = entity.read<String>('name');
      final type = entity.read<String>('type');

      await m.database
          .customStatement('DROP ${type.toUpperCase()} IF EXISTS $name;');
    }

    await m.createAll();
  }
}
