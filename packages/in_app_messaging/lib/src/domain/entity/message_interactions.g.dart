// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_interactions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MessageInteractions _$MessageInteractionsFromJson(Map<String, dynamic> json) =>
    _MessageInteractions(
      message: json['message'] as String,
      seenEntries: (json['seen_entries'] as List<dynamic>)
          .map((e) => MessageSeenEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MessageInteractionsToJson(
        _MessageInteractions instance) =>
    <String, dynamic>{
      'message': instance.message,
      'seen_entries': instance.seenEntries,
    };
