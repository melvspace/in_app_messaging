import 'package:in_app_messaging/src/core/typedefs.dart';
import 'package:in_app_messaging/src/domain/entity/message_condition.dart';

class OnceCondition extends MessageCondition {
  @override
  JsonMap asJsonLogic() {
    return {
      '==': [
        {'var': 'interactions.last_seen'},
        null
      ],
    };
  }
}
