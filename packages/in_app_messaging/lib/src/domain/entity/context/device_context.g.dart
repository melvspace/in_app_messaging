// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_context.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeviceContext _$DeviceContextFromJson(Map<String, dynamic> json) =>
    _DeviceContext(
      platform: json['platform'] as String,
      version: json['version'] as String,
      versionNumber: json['version_number'] as String,
      language: json['language'] as String,
    );

Map<String, dynamic> _$DeviceContextToJson(_DeviceContext instance) =>
    <String, dynamic>{
      'platform': instance.platform,
      'version': instance.version,
      'version_number': instance.versionNumber,
      'language': instance.language,
    };
