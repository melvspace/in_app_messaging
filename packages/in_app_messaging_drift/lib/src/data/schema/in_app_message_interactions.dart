import 'package:drift/drift.dart';
import 'package:in_app_messaging_drift/src/data/converters/converters.dart';

class InAppMessageInteractions extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get message => text().unique()();
  TextColumn get interactions => text().map(DBC.json)();
}
