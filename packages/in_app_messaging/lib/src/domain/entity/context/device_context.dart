import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_context.freezed.dart';
part 'device_context.g.dart';

/// Device attributes exposed under the `device` key in condition data.
@freezed
abstract class DeviceContext with _$DeviceContext {
  const DeviceContext._();

  /// Creates device condition data.
  const factory DeviceContext({
    /// Operating system or runtime platform used in device conditions.
    required String platform,

    /// Human-readable application version.
    required String version,

    /// Numeric or sortable application version string.
    required String versionNumber,

    /// Device language code used in locale-aware targeting.
    required String language,
  }) = _DeviceContext;

  /// Looks up [key] in the serialized device data.
  String getByKey(String key) {
    return toJson()[key];
  }

  /// Returns a copy with [key] updated in the serialized device data.
  DeviceContext change(String key, String value) {
    final json = toJson();
    json[key] = value;

    return DeviceContext.fromJson(json);
  }

  /// Parses device data from JSON.
  factory DeviceContext.fromJson(Map<String, dynamic> json) =>
      _$DeviceContextFromJson({
        ...json,
        'extra': {...json} //
          ..removeWhere((key, value) => value is! String),
      });
}
