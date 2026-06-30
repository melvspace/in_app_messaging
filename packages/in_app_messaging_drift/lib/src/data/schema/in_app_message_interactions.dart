import 'package:drift/drift.dart';
import 'package:in_app_messaging_drift/src/data/converters/converters.dart';

/// Table for one aggregate interaction document per message.
class InAppMessageInteractions extends Table {
  /// Surrogate primary key.
  IntColumn get id => integer().autoIncrement()();

  /// Message id for the aggregate interaction document.
  TextColumn get message => text().unique()();

  /// JSON object containing aggregate interaction values.
  TextColumn get interactions => text().map(DBC.json)();
}
