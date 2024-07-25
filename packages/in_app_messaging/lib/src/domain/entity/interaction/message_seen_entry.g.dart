// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_seen_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageSeenEntryImpl _$$MessageSeenEntryImplFromJson(
        Map<String, dynamic> json) =>
    _$MessageSeenEntryImpl(
      date: DateTime.parse(json['date'] as String),
      trigger: json['trigger'] as String?,
      triggerProperties: json['trigger_properties'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$MessageSeenEntryImplToJson(
        _$MessageSeenEntryImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'trigger': instance.trigger,
      'trigger_properties': instance.triggerProperties,
    };
