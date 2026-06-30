import 'dart:async';
import 'dart:collection';

import 'package:async/async.dart';
import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:in_app_messaging/src/core/jsonlogic.dart';
import '../../../in_app_messaging.dart';

/// Message gateway backed by pluggable message, context, and interaction sources.
class DefaultMessageGateway implements MessageGateway {
  final MessageSource _messageSource;
  final InteractionSource _interactionSource;
  final ContextSource _contextSource;

  final AsyncCache<List<Message>> _messages =
      AsyncCache(const Duration(minutes: 5));

  final _events = <(String, DateTime, Map<String, dynamic>)>[];

  /// Creates a gateway using explicit data sources for each responsibility.
  DefaultMessageGateway({
    required MessageSource messageSource,
    required InteractionSource interactionSource,
    required ContextSource contextSource,
  })  : _messageSource = messageSource,
        _interactionSource = interactionSource,
        _contextSource = contextSource;

  // TODO(@melvspace): 07/05/24 return list of valid messages
  // TODO(@melvspace): 07/05/24 filter messages by concurrency priority?
  /// Selects the first dynamic message matching [event].
  ///
  /// Selection considers the message display window, trigger payload
  /// requirements, message priority, persisted interaction history, and the
  /// message condition.
  @override
  FutureOr<DynamicMessageContext?> evaluate(
    String event,
    Map<String, dynamic> properties,
  ) async {
    Iterable<Message> allMessages =
        await _messages.fetch(() async => _messageSource.fetchMessages());

    if (await handleSequences(event, properties, allMessages)
        case DynamicMessageContext context) {
      return context;
    }

    final now = DateTime.now();
    final eventTrigger = MessageEventTrigger(event: event, data: properties);
    final messages = allMessages
        .whereType<DynamicMessage>()
        .where(
          (message) =>
              now.isAfter(message.start) &&
              (message.end == null || now.isBefore(message.end!)) &&
              message.triggers.any(eventTrigger.contains),
        )
        .sortedBy<num>((element) => element.priority);

    for (final message in messages) {
      final interactions = await getInteractions(message.id);
      final context = DynamicMessageContext(
        message: message,
        trigger: eventTrigger,
        interactions: interactions,
        context: _contextSource.context,
      );

      final result = message.condition != null
          ? defaultJsonLogic.apply(
              message.condition,
              _buildConditionContext(properties, event, context),
            )
          : true;

      if (result == true) {
        return context;
      }
    }

    return null;
  }

  /// Loads interaction history used by recurrence conditions.
  FutureOr<MessageInteractions> getInteractions(String id) async {
    return _interactionSource.getInteractions(id);
  }

  /// Records a visible presentation for the selected message.
  @override
  FutureOr<void> markSeen({
    required String id,
    String? trigger,
    Map<String, dynamic>? triggerProperties,
  }) {
    return _interactionSource.markSeen(
      id: id,
      trigger: trigger,
      triggerProperties: triggerProperties,
    );
  }

  /// Attempts to match experimental event-sequence triggers.
  ///
  /// Sequence semantics are still experimental and may change.
  @experimental
  Future<DynamicMessageContext?> handleSequences(
    String event,
    Map<String, dynamic> properties,
    Iterable<Message> allMessages,
  ) async {
    _events.add((event, DateTime.now(), properties));

    for (final message in allMessages.whereType<DynamicMessage>()) {
      final sequenceTriggers =
          message.triggers.whereType<MessageEventSequenceTrigger>();
      for (final trigger in sequenceTriggers) {
        var triggerQueue = Queue<EventSequenceItem>.from(trigger.events);
        var eventQueue =
            Queue<(String, DateTime, Map<String, dynamic>)>.from(_events);

        var triggerEvent = triggerQueue.removeLast();
        double? delay;
        DateTime? prevEventTime;

        while (true) {
          if (eventQueue.isEmpty) break;
          if (triggerQueue.isEmpty) break;

          var event = eventQueue.removeLast();
          var delta =
              prevEventTime != null ? event.$2.difference(prevEventTime) : null;
          prevEventTime = event.$2;

          if (triggerEvent.name == event.$1) {
            if (delay case double seconds when delta!.inSeconds > seconds) {
              break;
            }

            delay = triggerEvent.maxDelay;
            if (eventQueue.isNotEmpty) {
              triggerEvent = triggerQueue.removeLast();
            }
          }
        }

        if (triggerQueue.isEmpty) {
          final interactions = await getInteractions(message.id);
          final context = DynamicMessageContext(
            message: message,
            trigger: trigger,
            interactions: interactions,
            context: _contextSource.context,
          );

          final result = message.condition != null
              ? defaultJsonLogic.apply(
                  message.condition,
                  _buildConditionContext(properties, event, context),
                )
              : true;

          if (result == true) {
            return context;
          }
        }
      }
    }
    return null;
  }

  Map<String, dynamic> _buildConditionContext(
    Map<String, dynamic> properties,
    String event,
    DynamicMessageContext context,
  ) {
    final conditionContext = {
      'event': {
        ...properties,
        'event_name': event,
      },
      ...context.context,
      'interactions': {
        'last_seen': context.interactions.seenEntries.lastOrNull //
            ?.toJson(),
        'seen_entries': context.interactions.seenEntries //
            .map((e) => e.toJson())
            .toList(),
      }
    };

    return conditionContext;
  }

  /// Device property writes are not implemented by this gateway yet.
  @override
  FutureOr<void> setDeviceProperty(String key, String? value) {
    // TODO: implement setDeviceProperty
    throw UnimplementedError();
  }

  /// User property writes are not implemented by this gateway yet.
  @override
  FutureOr<void> setUserProperty(String key, String? value) {
    // TODO: implement setUserProperty
    throw UnimplementedError();
  }
}
