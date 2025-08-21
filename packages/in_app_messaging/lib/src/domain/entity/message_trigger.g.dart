// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_trigger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageCronTrigger _$MessageCronTriggerFromJson(Map<String, dynamic> json) =>
    MessageCronTrigger(
      cron: json['cron'] as String,
      event: json['event'] as String?,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$MessageCronTriggerToJson(MessageCronTrigger instance) =>
    <String, dynamic>{
      'cron': instance.cron,
      'event': instance.event,
      'type': instance.$type,
    };

MessageEventTrigger _$MessageEventTriggerFromJson(Map<String, dynamic> json) =>
    MessageEventTrigger(
      event: json['event'] as String,
      data: json['data'] as Map<String, dynamic>? ?? const {},
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$MessageEventTriggerToJson(
        MessageEventTrigger instance) =>
    <String, dynamic>{
      'event': instance.event,
      'data': instance.data,
      'type': instance.$type,
    };

MessageEventSequenceTrigger _$MessageEventSequenceTriggerFromJson(
        Map<String, dynamic> json) =>
    MessageEventSequenceTrigger(
      events: (json['events'] as List<dynamic>)
          .map((e) => EventSequenceItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      data: (json['data'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>?)
          .toList(),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$MessageEventSequenceTriggerToJson(
        MessageEventSequenceTrigger instance) =>
    <String, dynamic>{
      'events': instance.events,
      'data': instance.data,
      'type': instance.$type,
    };
