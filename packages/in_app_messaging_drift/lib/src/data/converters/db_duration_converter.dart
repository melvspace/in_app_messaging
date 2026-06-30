import 'package:drift/drift.dart';

/// Encodes durations as microsecond counts.
class DBDurationConverter extends TypeConverter<Duration, int> {
  /// Creates a duration converter.
  const DBDurationConverter();

  /// Recreates a duration from stored microseconds.
  @override
  Duration fromSql(int fromDb) {
    return Duration(microseconds: fromDb);
  }

  /// Stores [value] as microseconds.
  @override
  int toSql(Duration value) {
    return value.inMicroseconds;
  }
}
