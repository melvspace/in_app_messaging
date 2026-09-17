import 'package:in_app_messaging_condition/src/runtime/condition_object.dart';

abstract class const ConditionExtension<T extends Object>() {
  bool check(Object object);

  ConditionObject toConditionObject(T value);
}
