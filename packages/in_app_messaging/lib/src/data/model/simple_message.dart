import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:in_app_messaging/src/core/typedefs.dart';
import '../../../in_app_messaging.dart';

part 'simple_message.freezed.dart';
part 'simple_message.g.dart';

/// JSON-backed campaign definition for runtime-triggered messages.
@freezed
abstract class SimpleMessage with _$SimpleMessage implements DynamicMessage {
  /// Creates a campaign definition that can be loaded from JSON.
  const factory SimpleMessage({
    /// Stable campaign key used to associate interaction history with this message.
    ///
    /// Reusing an id means existing seen records and frequency checks apply to
    /// the new definition.
    required String id,

    /// Whether this message can be considered for display.
    ///
    /// Disabled messages are skipped even when their trigger, schedule, and
    /// targeting match.
    required bool enabled,

    /// Lookup key for the presentation handle that knows how to render [data].
    required MessageType type,

    /// Earliest instant when this message can be considered for display.
    required DateTime start,

    /// Instant after which this message is no longer considered for display.
    ///
    /// A null value leaves the display window open-ended after [start].
    DateTime? end,

    /// Priority used when multiple messages are eligible for the same event.
    @Default(0) int priority,

    /// Runtime triggers that can make this message eligible for display.
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
