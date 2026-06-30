import 'package:drift/drift.dart';

/// Append-only table of visible message presentations.
class InAppMessageSeenDates extends Table {
  /// Unique row identifier.
  IntColumn get id => integer().autoIncrement()();

  /// Message id whose presentation became visible.
  TextColumn get message => text()();

  /// Time when presentation reported shown.
  DateTimeColumn get seen => dateTime()();

  /// Event name captured from the trigger, if the trigger was an event.
  TextColumn get trigger => text().nullable()();

  /// Event payload captured for recurrence conditions.
  TextColumn get triggerProperties => text().nullable()();
}
