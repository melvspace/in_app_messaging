import 'package:in_app_messaging/in_app_messaging.dart';
import 'package:in_app_messaging/src/core/typedefs.dart';

/// A campaign definition that can become an in-app message.
///
/// A message is considered for display only when it is enabled, inside its
/// display window, matched by the current trigger, allowed by targeting, and
/// not blocked by recorded interaction history.
abstract class Message {
  /// Stable campaign key used to associate interaction history with this message.
  ///
  /// Reusing an id means existing seen records and frequency checks apply to
  /// the new definition.
  String get id;

  /// Whether this message can be considered for display.
  ///
  /// Disabled messages are skipped even when their trigger, schedule, and
  /// targeting match.
  bool get enabled;

  /// Lookup key for the presentation handle that knows how to render [data].
  ///
  /// If no handle is registered for this type, presentation finishes with
  /// [PresentationNotShownReason.missingHandle] and no seen entry is recorded.
  MessageType get type;

  /// Earliest instant when this message can be considered for display.
  DateTime get start;

  /// Instant after which this message is no longer considered for display.
  ///
  /// A null value leaves the display window open-ended after [start].
  DateTime? get end;

  /// Targeting rule evaluated after trigger and time-window matching.
  ///
  /// A null condition means the message relies only on trigger, schedule, and
  /// interaction checks.
  dynamic get condition;

  /// Opaque payload consumed by the presentation handle for [type].
  ///
  /// The core package does not inspect this map.
  JsonMap get data;

  /// Serializes the message definition for storage or transport.
  JsonMap toJson();
}
