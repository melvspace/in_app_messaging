import 'package:in_app_messaging_drift/src/data/converters/converters.dart';

export 'db_color_converter.dart';
export 'db_duration_converter.dart';
export 'db_json_map_converter.dart';

/// Canonical converters used by the Drift schema.
abstract final class DBC {
  /// Persists a non-null [Color] as its ARGB integer.
  static const color = DBColorConverter();

  /// Persists nullable color lists as comma-separated ARGB values.
  static const colors = DBColorListConverter();

  /// Persists [Duration] values as microseconds.
  static const duration = DBDurationConverter();

  /// Persists JSON objects as encoded text.
  static const json = DBJsonMapConverter();

  /// Persists JSON object lists as encoded text.
  static const jsonArray = DBJsonListConverter();
}
