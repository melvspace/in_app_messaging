import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:in_app_messaging/src/core/typedefs.dart';
import '../../../in_app_messaging.dart';

part 'simple_message.freezed.dart';
part 'simple_message.g.dart';

/// JSON-serializable dynamic message model for configured campaigns.
@freezed
abstract class SimpleMessage with _$SimpleMessage implements DynamicMessage {
  /// Creates a configured dynamic message.
  const factory SimpleMessage({
    /// Stable key for interaction history and presentation de-duplication.
    required String id,

    /// Active flag supplied by the message source.
    required bool enabled,

    /// Presentation handle lookup key.
    required MessageType type,

    /// Start of the display window.
    required DateTime start,

    /// End of the display window, or null for no scheduled end.
    DateTime? end,

    /// Priority used when multiple messages are eligible for the same event.
    @Default(0) int priority,

    /// Runtime triggers that can make this message a candidate.
    required List<MessageTrigger> triggers,

    /// Targeting rule evaluated after trigger and time-window matching.
    ///
    /// A null condition means the message relies only on trigger, schedule, and
    /// interaction checks.
    dynamic condition,

    /// Opaque payload consumed by the presentation handle for [type].
    required JsonMap data,
  }) = _SimpleMessage;

  /// Parses a configured message from JSON.
  factory SimpleMessage.fromJson(Map<String, dynamic> json) =>
      _$SimpleMessageFromJson(json);
}
