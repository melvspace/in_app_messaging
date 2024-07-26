import 'package:in_app_messaging/src/core/typedefs.dart';
import 'package:in_app_messaging/src/domain/entity/message_condition.dart';

class OncePerDayCondition extends MessageCondition {
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
