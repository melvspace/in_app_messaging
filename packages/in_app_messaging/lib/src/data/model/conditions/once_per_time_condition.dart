import 'package:in_app_messaging/src/core/typedefs.dart';
import 'package:in_app_messaging/src/domain/entity/message_condition.dart';

/// Allows a message after a fixed delay since the last seen entry.
class OncePerTimeCondition extends MessageCondition {
  /// Minimum elapsed time required between visible presentations.
  final Duration duration;

  /// Creates a recurrence rule using [duration].
  OncePerTimeCondition({required this.duration});

  /// Compares `interactions.last_seen.date` with the current time minus [duration].
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
            {'var': 'interactions.last_seen.date'}
          ]
        }
      ]
    };
  }
}
