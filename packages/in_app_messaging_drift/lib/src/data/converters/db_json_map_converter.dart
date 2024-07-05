import 'dart:convert';

import 'package:drift/drift.dart';

class DBJsonMapConverter extends TypeConverter<Map<String, dynamic>, String> {
  const DBJsonMapConverter();

  @override
  Map<String, dynamic> fromSql(String fromDb) {
    return jsonDecode(fromDb);
  }

  @override
  String toSql(Map<String, Object?> value) {
    return jsonEncode(value);
  }
}

class DBJsonListConverter extends TypeConverter<List<Map<String, dynamic>>, String> {
  const DBJsonListConverter();

  @override
  List<Map<String, dynamic>> fromSql(String fromDb) {
    return jsonDecode(fromDb);
  }

  @override
  String toSql(List<Map<String, dynamic>> value) {
    return jsonEncode(value);
  }
}
