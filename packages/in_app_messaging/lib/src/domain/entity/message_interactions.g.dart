// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_interactions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageInteractionsImpl _$$MessageInteractionsImplFromJson(
        Map<String, dynamic> json) =>
    _$MessageInteractionsImpl(
      message: json['message'] as String,
      seenDates: (json['seen_dates'] as List<dynamic>)
          .map((e) => DateTime.parse(e as String))
          .toList(),
      additional: json['additional'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$MessageInteractionsImplToJson(
        _$MessageInteractionsImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'seen_dates': instance.seenDates.map((e) => e.toIso8601String()).toList(),
      'additional': instance.additional,
    };
