import 'package:drift/drift.dart' hide isNull;
import 'package:drift/native.dart';
import 'package:drift_dev/api/migrations_native.dart';
import 'package:in_app_messaging_drift/in_app_messaging_drift.dart';
import 'package:test/test.dart';

import 'generated_migrations/schema.dart';

void main() {
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;

  late SchemaVerifier verifier;

  setUp(() {
    verifier = SchemaVerifier(GeneratedHelper());
  });

  test('latest schema creates and validates', () async {
    final database = InAppMessagingDatabase(
      executor: NativeDatabase.memory(),
    );
    addTearDown(database.close);

    await database.validateDatabaseSchema();
  });

  test('migrates v1 to v2 while preserving seen rows', () async {
    final schema = await verifier.schemaAt(1);
    addTearDown(schema.close);
    schema.rawDatabase.execute(
      'INSERT INTO in_app_message_seen_dates (message, seen) VALUES (?, ?)',
      ['message', 0],
    );

    final database = InAppMessagingDatabase(
      executor: schema.newConnection(),
    );
    await verifier.migrateAndValidate(database, 2);
    await database.close();

    final rows = schema.rawDatabase.select(
      'SELECT message, trigger, trigger_properties '
      'FROM in_app_message_seen_dates',
    );

    expect(rows, hasLength(1));
    expect(rows.single['message'], 'message');
    expect(rows.single['trigger'], isNull);
    expect(rows.single['trigger_properties'], isNull);
  });

  test('downgrade resets stale schema to current tables', () async {
    final schema = await verifier.schemaAt(2);
    addTearDown(schema.close);
    schema.rawDatabase.execute('CREATE TABLE stale_table (id INTEGER)');
    schema.rawDatabase.execute('PRAGMA user_version = 3');

    final database = InAppMessagingDatabase(
      executor: schema.newConnection(),
    );
    addTearDown(database.close);

    await database.customSelect('SELECT 1').get();

    final staleRows = schema.rawDatabase.select(
      "SELECT name FROM sqlite_master WHERE name = 'stale_table'",
    );

    expect(staleRows, isEmpty);
    await database.validateDatabaseSchema();
  });
}
