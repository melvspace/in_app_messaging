// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simple_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SimpleMessageImpl _$$SimpleMessageImplFromJson(Map<String, dynamic> json) =>
    _$SimpleMessageImpl(
      id: json['id'] as String,
      enabled: json['enabled'] as bool,
      type: MessageType.fromJson(json['type'] as Map<String, dynamic>),
      start: DateTime.parse(json['start'] as String),
      end: json['end'] == null ? null : DateTime.parse(json['end'] as String),
      priority: (json['priority'] as num?)?.toInt() ?? 0,
      triggers: (json['triggers'] as List<dynamic>)
          .map((e) => MessageTrigger.fromJson(e as Map<String, dynamic>))
          .toList(),
      condition: json['condition'] as Map<String, dynamic>?,
      data: json['data'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$SimpleMessageImplToJson(_$SimpleMessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'enabled': instance.enabled,
      'type': instance.type,
      'start': instance.start.toIso8601String(),
      'end': instance.end?.toIso8601String(),
      'priority': instance.priority,
      'triggers': instance.triggers,
      'condition': instance.condition,
      'data': instance.data,
    };
