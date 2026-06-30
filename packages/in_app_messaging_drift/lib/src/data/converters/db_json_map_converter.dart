import 'dart:convert';

import 'package:drift/drift.dart';

/// Encodes JSON objects as text for Drift columns.
class DBJsonMapConverter extends TypeConverter<Map<String, dynamic>, String> {
  /// Creates a JSON object converter.
  const DBJsonMapConverter();

  /// Decodes stored JSON text into a map.
  @override
  Map<String, dynamic> fromSql(String fromDb) {
    return jsonDecode(fromDb);
  }

  /// Encodes [value] as JSON text.
  @override
  String toSql(Map<String, Object?> value) {
    return jsonEncode(value);
  }
}

/// Encodes JSON object lists as text for Drift columns.
class DBJsonListConverter
    extends TypeConverter<List<Map<String, dynamic>>, String> {
  /// Creates a JSON object list converter.
  const DBJsonListConverter();

  /// Decodes stored JSON text into a list of maps.
  @override
  List<Map<String, dynamic>> fromSql(String fromDb) {
    return jsonDecode(fromDb);
  }

  /// Encodes [value] as JSON text.
  @override
  String toSql(List<Map<String, dynamic>> value) {
    return jsonEncode(value);
  }
}
