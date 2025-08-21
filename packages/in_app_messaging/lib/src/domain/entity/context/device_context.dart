import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_context.freezed.dart';
part 'device_context.g.dart';

@freezed
abstract class DeviceContext with _$DeviceContext {
  const DeviceContext._();

  const factory DeviceContext({
    required String platform,
    required String version,
    required String versionNumber,
    required String language,
  }) = _DeviceContext;

  String getByKey(String key) {
    return toJson()[key];
  }

  DeviceContext change(String key, String value) {
    final json = toJson();
    json[key] = value;

    return DeviceContext.fromJson(json);
  }

  factory DeviceContext.fromJson(Map<String, dynamic> json) =>
      _$DeviceContextFromJson({
        ...json,
        'extra': {...json} //
          ..removeWhere((key, value) => value is! String),
      });
}
