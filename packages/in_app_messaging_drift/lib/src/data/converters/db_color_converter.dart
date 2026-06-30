import 'dart:ui';

import 'package:drift/drift.dart';

// ignore: unintended_html_in_doc_comment
/// Encodes nullable colors as comma-separated ARGB integers.
///
/// Null entries are stored as the literal `none`.
class DBColorListConverter extends TypeConverter<List<Color?>, String> {
  final DBColorConverter _inner;

  /// Uses [DBColorConverter] for each non-null color.
  const DBColorListConverter() : _inner = const DBColorConverter();

  /// Decodes a comma-separated database value.
  @override
  List<Color?> fromSql(String fromDb) {
    final values = fromDb.split(',');
    return values
        .map((e) => e == 'none' ? null : _inner.fromSql(int.parse(e)))
        .toList();
  }

  /// Encodes [value] as a comma-separated database value.
  @override
  String toSql(List<Color?> value) {
    return value.map((e) => e?.toARGB32() ?? 'none').join(',');
  }
}

/// Encodes a [Color] as its ARGB integer value.
class DBColorConverter extends TypeConverter<Color, int> {
  /// Creates a color converter.
  const DBColorConverter();

  /// Recreates a color from its stored ARGB integer.
  @override
  Color fromSql(int fromDb) {
    return Color(fromDb);
  }

  /// Stores [value] as an ARGB integer.
  @override
  int toSql(Color value) {
    return value.toARGB32();
  }
}
