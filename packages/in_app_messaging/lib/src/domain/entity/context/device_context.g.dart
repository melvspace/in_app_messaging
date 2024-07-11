// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_context.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeviceContextImpl _$$DeviceContextImplFromJson(Map<String, dynamic> json) =>
    _$DeviceContextImpl(
      platform: json['platform'] as String,
      version: json['version'] as String,
      versionNumber: json['version_number'] as String,
      language: json['language'] as String,
    );

Map<String, dynamic> _$$DeviceContextImplToJson(_$DeviceContextImpl instance) =>
    <String, dynamic>{
      'platform': instance.platform,
      'version': instance.version,
      'version_number': instance.versionNumber,
      'language': instance.language,
    };
