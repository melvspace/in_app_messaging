// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_interactions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageInteractionsImpl _$$MessageInteractionsImplFromJson(
        Map<String, dynamic> json) =>
    _$MessageInteractionsImpl(
      message: json['message'] as String,
      seenEntries: (json['seen_entries'] as List<dynamic>)
          .map((e) => MessageSeenEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MessageInteractionsImplToJson(
        _$MessageInteractionsImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'seen_entries': instance.seenEntries,
    };
