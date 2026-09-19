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

    /// Lower bound of the display window.
    ///
    /// The message is considered only after this instant has passed.
    required DateTime start,

    /// Upper bound of the display window.
    ///
    /// The message is considered only before this instant. A null value leaves the
    /// display window open-ended after [start].
    DateTime? end,

    /// Ordering value used when multiple messages are eligible for the same event.
    ///
    /// Lower values are evaluated first. The default priority is 0.
    @Default(0) int priority,

    /// Runtime triggers that can make this message eligible for display.
    required List<MessageTrigger> triggers,

    /// Targeting and recurrence rule for this message.
    ///
    /// Strings use the condition expression language. Other values use JsonLogic
    /// for backwards compatibility. The rule is evaluated after trigger and
    /// time-window matching with event payload, context data, and seen history
    /// available. A null condition adds no extra constraint.
    dynamic condition,

    /// Opaque payload consumed by the presentation handle for [type].
    required JsonMap data,
  }) = _SimpleMessage;

  /// Parses a configured message from JSON.
  factory SimpleMessage.fromJson(Map<String, dynamic> json) =>
      _$SimpleMessageFromJson(json);
}
