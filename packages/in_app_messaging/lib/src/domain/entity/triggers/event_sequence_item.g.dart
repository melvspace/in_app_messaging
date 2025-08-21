// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_sequence_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EventSequenceItem _$EventSequenceItemFromJson(Map<String, dynamic> json) =>
    _EventSequenceItem(
      name: json['name'] as String,
      expected: json['expected'] as bool? ?? true,
      maxDelay: (json['max_delay'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$EventSequenceItemToJson(_EventSequenceItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'expected': instance.expected,
      'max_delay': instance.maxDelay,
    };
