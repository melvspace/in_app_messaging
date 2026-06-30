import 'package:in_app_messaging/src/core/typedefs.dart';
import 'package:in_app_messaging/src/domain/entity/message_condition.dart';

/// Allows a message only when it has no previous seen entry.
class OnceCondition extends MessageCondition {
  /// Checks that `interactions.last_seen` is null.
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
