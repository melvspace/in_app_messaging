import 'package:drift/drift.dart';

class DBDurationConverter extends TypeConverter<Duration, int> {
  const DBDurationConverter();

  @override
  Duration fromSql(int fromDb) {
    return Duration(microseconds: fromDb);
  }

  @override
  int toSql(Duration value) {
    return value.inMicroseconds;
  }
}
