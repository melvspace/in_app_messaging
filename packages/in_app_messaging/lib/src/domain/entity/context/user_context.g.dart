// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_context.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserContextImpl _$$UserContextImplFromJson(Map<String, dynamic> json) =>
    _$UserContextImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      language: json['language'] as String?,
      extra: (json['extra'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {},
    );

Map<String, dynamic> _$$UserContextImplToJson(_$UserContextImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'language': instance.language,
      'extra': instance.extra,
    };
