import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_sequence_item.freezed.dart';
part 'event_sequence_item.g.dart';

@freezed
@experimental
abstract class EventSequenceItem with _$EventSequenceItem {
  const factory EventSequenceItem({
    required String name,

    /// Indicates that the event is expected in the sequence
    ///
    /// If value is false and event occured as trigger it elimates any existing pending sequence.
    ///
    /// Example:
    ///   - `exam_completed, exam_closed, !diploma_form_opened(for 2 seconds)`
    ///   - if `diploma_form_opened` occured in 2 seconds after `exam_closed` whole sequence is dropped
    @Default(true) bool expected,

    /// Maximum delay since previous event in seconds
    ///
    /// By default checked against infinite delay
    double? maxDelay,
  }) = _EventSequenceItem;

  factory EventSequenceItem.fromJson(Map<String, dynamic> json) =>
      _$EventSequenceItemFromJson(json);
}

/// Example:
///
/// - `event`
/// - `!event`
/// - `!event (3s)`
/// - `!event (3)`
/// - `event (3)`
/// - `event (3s)`
/// - `event_bla (3s)`
/// - `event_bla-bla (3s)`
/// - `event_bla-bla.asd (3s)`
/// - `event_bla-bla.asd(3s)`
/// - `event_bla-bla.asd(3)`
/// - `event_bla-bla.asd(3.23s)`
/// - `!event_bla-bla.asd(3,323s)`
/// - `event_bla-bla.asd(3,323s)`
@experimental
class EventSequenceItemStringConverter
    extends JsonConverter<EventSequenceItem, String> {
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

  @override
  String toJson(EventSequenceItem object) {
    return '${object.expected ? '' : '!'}'
        '${object.name}'
        '${object.maxDelay != null ? '(${object.maxDelay}s)' : ''}';
  }
}
