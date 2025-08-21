// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_seen_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MessageSeenEntry _$MessageSeenEntryFromJson(Map<String, dynamic> json) =>
    _MessageSeenEntry(
      date: DateTime.parse(json['date'] as String),
      trigger: json['trigger'] as String?,
      triggerProperties: json['trigger_properties'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$MessageSeenEntryToJson(_MessageSeenEntry instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'trigger': instance.trigger,
      'trigger_properties': instance.triggerProperties,
    };
