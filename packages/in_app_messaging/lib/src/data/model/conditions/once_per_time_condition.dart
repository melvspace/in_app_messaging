import 'package:in_app_messaging/src/core/typedefs.dart';
import 'package:in_app_messaging/src/domain/entity/message_condition.dart';

class OncePerTimeCondition extends MessageCondition {
  final Duration duration;

  OncePerTimeCondition({required this.duration});

  @override
  JsonMap asJsonLogic() {
    return {
      'or': [
        {
          '==': [
            {'var': 'interactions.last_seen'},
            null
          ]
        },
        {
          '>': [
            {
              '-': [
                {'now': []},
                duration.inMicroseconds,
                'microseconds'
              ]
            },
            {'var': 'interactions.last_seen'}
          ]
        }
      ]
    };
  }
}
