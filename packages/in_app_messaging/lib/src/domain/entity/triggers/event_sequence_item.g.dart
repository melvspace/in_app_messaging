// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_sequence_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventSequenceItemImpl _$$EventSequenceItemImplFromJson(
        Map<String, dynamic> json) =>
    _$EventSequenceItemImpl(
      name: json['name'] as String,
      expected: json['expected'] as bool? ?? true,
      maxDelay: (json['max_delay'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$EventSequenceItemImplToJson(
        _$EventSequenceItemImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'expected': instance.expected,
      'max_delay': instance.maxDelay,
    };
