import 'package:in_app_messaging/src/core/typedefs.dart';

import '../../../domain/entity/message_condition.dart';

class AndCondition extends MessageCondition {
  final MessageCondition left;
  final MessageCondition right;

  AndCondition(this.left, this.right);

  @override
  @override
  JsonMap asJsonLogic() {
    return {
      "and": [
        left.asJsonLogic(),
        right.asJsonLogic(),
      ]
    };
  }
}
