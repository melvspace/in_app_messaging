import 'package:in_app_messaging/in_app_messaging.dart';
import 'package:in_app_messaging/src/core/typedefs.dart';

/// A configured in-app message candidate.
///
/// Message sources provide these definitions to the gateway. The gateway
/// evaluates their trigger, time window, condition, and interaction history
/// before handing an eligible message to presentation code.
abstract class Message {
  /// Stable key used for interaction history and presentation de-duplication.
  String get id;

  /// Whether the upstream source considers the message active.
  bool get enabled;

  /// Lookup key for the presentation handle that knows how to render [data].
  ///
  /// If no handle is registered for this type, presentation finishes with
  /// [PresentationNotShownReason.missingHandle] and no seen entry is recorded.
  MessageType get type;

  /// Start of the message's display window.
  DateTime get start;

  /// End of the message's display window, or null for no scheduled end.
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

  /// Serializes the complete message definition.
  JsonMap toJson();
}
