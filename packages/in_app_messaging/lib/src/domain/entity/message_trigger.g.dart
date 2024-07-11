// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_trigger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageCronTriggerImpl _$$MessageCronTriggerImplFromJson(
        Map<String, dynamic> json) =>
    _$MessageCronTriggerImpl(
      cron: json['cron'] as String,
      event: json['event'] as String?,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$MessageCronTriggerImplToJson(
        _$MessageCronTriggerImpl instance) =>
    <String, dynamic>{
      'cron': instance.cron,
      'event': instance.event,
      'type': instance.$type,
    };

_$MessageEventTriggerImpl _$$MessageEventTriggerImplFromJson(
        Map<String, dynamic> json) =>
    _$MessageEventTriggerImpl(
      event: json['event'] as String,
      data: json['data'] as Map<String, dynamic>? ?? const {},
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$MessageEventTriggerImplToJson(
        _$MessageEventTriggerImpl instance) =>
    <String, dynamic>{
      'event': instance.event,
      'data': instance.data,
      'type': instance.$type,
    };

_$MessageEventSequenceTriggerImpl _$$MessageEventSequenceTriggerImplFromJson(
        Map<String, dynamic> json) =>
    _$MessageEventSequenceTriggerImpl(
      events: (json['events'] as List<dynamic>)
          .map((e) => EventSequenceItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      data: (json['data'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>?)
          .toList(),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$MessageEventSequenceTriggerImplToJson(
        _$MessageEventSequenceTriggerImpl instance) =>
    <String, dynamic>{
      'events': instance.events,
      'data': instance.data,
      'type': instance.$type,
    };
