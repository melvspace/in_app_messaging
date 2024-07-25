import 'package:drift/drift.dart';

class InAppMessageSeenDates extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get message => text()();
  DateTimeColumn get seen => dateTime()();

  /// seen for trigger
  TextColumn get trigger => text().nullable()();
  TextColumn get triggerProperties => text().nullable()();
}
