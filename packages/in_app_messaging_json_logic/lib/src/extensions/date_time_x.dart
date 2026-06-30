/// Precision truncation used by JsonLogic date operators.
extension DateTimeX on DateTime {
  /// Drops fields below the first enabled precision flag.
  DateTime truncate({
    bool toYears = false,
    bool toMonths = false,
    bool toDays = false,
    bool toHours = false,
    bool toMinutes = false,
    bool toSeconds = false,
    bool toMilliseconds = false,
  }) {
    if (toYears) {
      return DateTime(year);
    } else if (toMonths) {
      return DateTime(year, month);
    } else if (toDays) {
      return DateTime(year, month, day);
    } else if (toHours) {
      return DateTime(year, month, day, hour);
    } else if (toMinutes) {
      return DateTime(
        year,
        month,
        day,
        hour,
        minute,
      );
    } else if (toSeconds) {
      return DateTime(year, month, day, hour, minute, second);
    } else if (toMilliseconds) {
      return DateTime(year, month, day, hour, minute, second, millisecond);
    }

    return this;
  }
}
