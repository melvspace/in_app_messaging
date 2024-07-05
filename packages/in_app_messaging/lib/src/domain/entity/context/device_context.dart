import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_context.freezed.dart';
part 'device_context.g.dart';

@freezed
class DeviceContext with _$DeviceContext {
  const factory DeviceContext({
    required String platform,
    required String version,
    required String versionNumber,
  }) = _DeviceContext;

  factory DeviceContext.fromJson(Map<String, dynamic> json) =>
      _$DeviceContextFromJson(json);
}
