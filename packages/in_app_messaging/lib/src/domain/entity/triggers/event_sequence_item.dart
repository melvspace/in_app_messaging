import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_sequence_item.freezed.dart';
part 'event_sequence_item.g.dart';

/// One expectation in an experimental event-sequence trigger.
@freezed
@experimental
abstract class EventSequenceItem with _$EventSequenceItem {
  /// Creates a sequence expectation.
  const factory EventSequenceItem({
    /// Event name to observe in the sequence.
    required String name,

    /// Whether [name] is expected or forbidden.
    ///
    /// A forbidden event is intended to invalidate a pending sequence when it is
    /// observed before [maxDelay] expires.
    ///
    /// Example:
    ///   - `exam_completed, exam_closed, !diploma_form_opened(for 2 seconds)`
    ///   - if `diploma_form_opened` occurs within 2 seconds after
    ///     `exam_closed`, the whole sequence is dropped.
    @Default(true) bool expected,

    /// Maximum delay since the previous sequence event, in seconds.
    ///
    /// A null value leaves the delay unbounded.
    double? maxDelay,
  }) = _EventSequenceItem;

  /// Parses a sequence expectation from JSON.
  factory EventSequenceItem.fromJson(Map<String, dynamic> json) =>
      _$EventSequenceItemFromJson(json);
}

/// Converts [EventSequenceItem] values to and from compact strings.
///
/// Supported forms include `event`, `!event`, `event(3s)`, and
/// `!event_name(3.23s)`.
@experimental
class EventSequenceItemStringConverter
    extends JsonConverter<EventSequenceItem, String> {
  /// Parses compact syntax into a sequence expectation.
  @override
  EventSequenceItem fromJson(String json) {
    json = json.trim();
    final regexp = RegExp(r'(!)?([a-zA-Z_\-.]+)\s?(\((\d+[\.,]?\d*)s?\))?');
    final match = regexp.firstMatch(json);
    final event = match?.group(2);

    if (match == null || event == null) {
      throw ArgumentError(
        'Invalid string. Expected format - ${regexp.pattern}',
      );
    }

    final expected = match.group(1) == null;
    final maxDelay = double.tryParse(match.group(4) ?? '');

    return EventSequenceItem(
      name: event,
      expected: expected,
      maxDelay: maxDelay,
    );
  }

  /// Serializes a sequence expectation to compact syntax.
  @override
  String toJson(EventSequenceItem object) {
    return '${object.expected ? '' : '!'}'
        '${object.name}'
        '${object.maxDelay != null ? '(${object.maxDelay}s)' : ''}';
  }
}
