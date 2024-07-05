import 'package:in_app_messaging_drift/src/data/converters/converters.dart';

export 'db_color_converter.dart';
export 'db_duration_converter.dart';
export 'db_json_map_converter.dart';

abstract final class DBC {
  static const color = DBColorConverter();
  static const colors = DBColorListConverter();
  static const duration = DBDurationConverter();
  static const json = DBJsonMapConverter();
  static const jsonArray = DBJsonListConverter();
}
