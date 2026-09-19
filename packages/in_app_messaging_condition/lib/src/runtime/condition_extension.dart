import 'package:in_app_messaging_condition/src/runtime/condition_object.dart';

abstract class ConditionExtension<T extends Object> {
  const ConditionExtension();

  bool check(Object object);

  ConditionObject toConditionObject(T value);
}
