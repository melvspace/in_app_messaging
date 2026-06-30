import 'package:in_app_messaging/src/core/typedefs.dart';
import 'package:in_app_messaging/src/domain/entity/message_condition.dart';

/// Allows a message once per calendar day.
class OncePerDayCondition extends MessageCondition {
  /// Compares the truncated date of `interactions.last_seen` with today.
  @override
  JsonMap asJsonLogic() {
    return {
      'or': [
        {
          '==': [
            {
              'var': ['interactions.last_seen']
            },
            null
          ]
        },
        {
          '<': [
            {
              'date.truncate': [
                {
                  'var': ['interactions.last_seen.date']
                },
                "days"
              ]
            },
            {
              'date.truncate': [
                {'now': []},
                "days"
              ]
            }
          ]
        }
      ]
    };
  }
}
