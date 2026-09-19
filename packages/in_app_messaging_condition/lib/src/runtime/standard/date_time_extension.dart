import 'package:in_app_messaging_condition/in_app_messaging_condition.dart';

class DateTimeConditionObject extends ConditionObject {
  DateTimeConditionObject(this.dateTime);

  final DateTime dateTime;

  @override
  bool less(covariant DateTime other) => dateTime.isBefore(other);

  @override
  bool greater(covariant DateTime other) => dateTime.isAfter(other);

  @override
  bool equals(covariant DateTime other) => dateTime.isAtSameMomentAs(other);
}

class DateTimeConditionExtension extends ConditionExtension<DateTime> {
  const DateTimeConditionExtension();

  @override
  bool check(Object object) {
    return object is DateTime;
  }

  @override
  ConditionObject toConditionObject(DateTime value) {
    return DateTimeConditionObject(value);
  }
}
