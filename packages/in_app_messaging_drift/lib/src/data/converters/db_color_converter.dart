import 'dart:ui';

import 'package:drift/drift.dart';

/// Stores color list as '<int_color>,<int_color>';
class DBColorListConverter extends TypeConverter<List<Color?>, String> {
  final DBColorConverter _inner;

  const DBColorListConverter() : _inner = const DBColorConverter();

  @override
  List<Color?> fromSql(String fromDb) {
    final values = fromDb.split(',');
    return values.map((e) => e == 'none' ? null : _inner.fromSql(int.parse(e))).toList();
  }

  @override
  String toSql(List<Color?> value) {
    return value.map((e) => e?.value ?? 'none').join(',');
  }
}

/// Stores color as int value.
class DBColorConverter extends TypeConverter<Color, int> {
  const DBColorConverter();

  @override
  Color fromSql(int fromDb) {
    return Color(fromDb);
  }

  @override
  int toSql(Color value) {
    return value.value;
  }
}
