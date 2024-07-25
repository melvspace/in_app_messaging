import 'package:in_app_messaging/src/core/typedefs.dart';

import '../../../domain/entity/message_condition.dart';

class OrCondition extends MessageCondition {
  final MessageCondition left;
  final MessageCondition right;

  OrCondition(this.left, this.right);

  @override
  JsonMap asJsonLogic() {
    return {
      'or': [
        left.asJsonLogic(),
        right.asJsonLogic(),
      ],
    };
  }
}
