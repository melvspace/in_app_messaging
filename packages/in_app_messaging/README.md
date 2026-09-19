# In-App Messaging

Core Flutter package for evaluating and presenting in-app messages.

The package is built around event-triggered in-app messaging: the host
application reports an event, the gateway evaluates configured messages, and the
presenter shows the selected message through an application-provided handler.

## Features

- Event-triggered in-app messages
- JsonLogic-backed conditions
- User, device, event, and interaction-history values in the evaluation context
- Built-in condition builders for common frequency and property checks
- Message priority for choosing one message when multiple messages are eligible
- Presentation suppression for navigation or other temporary UI states
- In-memory sources for tests and simple integrations

Static in-app messages and placements are future scope and are not stable public
API yet.

## Concepts

- **In-App Message**: configured content, eligibility rules, timing, and
  presentation metadata.
- **Event**: application occurrence reported to the SDK.
- **Event Trigger**: message rule that matches an event name and optional exact
  event properties.
- **Condition**: JsonLogic rule evaluated against the evaluation context.
- **Seen Entry**: durable record written only after presentation actually shows
  a message.
- **Message Type**: value used by presentation to select a handler.

The workspace glossary defines the full domain language for repository
contributors.

## Basic Setup

Create a gateway from message, interaction, and context sources:

```dart
final messaging = InAppMessaging.initialize(
  gateway: DefaultMessageGateway(
    messageSource: MemoryMessageSource(
      messages: [
        SimpleMessage(
          id: 'welcome',
          enabled: true,
          type: const MessageType(name: 'dialog'),
          start: DateTime.now().subtract(const Duration(minutes: 1)),
          triggers: const [
            MessageTrigger.event(event: 'app_opened'),
          ],
          condition: OnceCondition().asJsonLogic(),
          data: {
            'title': 'Welcome',
            'body': 'Thanks for opening the app.',
          },
        ),
      ],
    ),
    interactionSource: MemoryInteractionSource(),
    contextSource: MemoryContextSource(
      context: {
        'device': {
          'platform': 'android',
          'version': '1.0.0',
          'version_number': '1',
          'language': 'en',
        },
        'user': {
          'id': 'user-1',
        },
      },
    ),
  ),
);
```

Wrap the app with a presenter and provide handlers for message types:

```dart
DynamicMessagePresenter(
  builders: {
    const MessageType(name: 'dialog'): (context) => MyDialogMessageHandle(
          context: context,
        ),
  },
  child: const MaterialApp(
    home: HomeScreen(),
  ),
);
```

Report events from the host application:

```dart
await messaging.trigger('app_opened', {
  'source': 'launcher',
});
```

When a message is selected, presentation decides whether and how it is shown.
The package records a seen entry only when the presentation handler reports that
the in-app message became visible. The presentation queue waits for the visible
surface to complete before showing the next queued message.

## Conditions

String conditions use the condition expression language:

```dart
final condition = 'user.plan == "pro" and event.source == "launcher"';
```

Existing JsonLogic conditions remain supported. Use raw JsonLogic maps or the
built-in condition builders when JsonLogic-specific operators are needed:

```dart
final condition = (UserPropertyCondition(
          key: 'plan',
          type: ComparisonType.exactlyMatches,
          value: 'pro',
        ) &
        OncePerDayCondition())
    .asJsonLogic();
```

The evaluation context includes:

- `event`: reported event properties and `event_name`
- `user`: user attributes supplied by the context source
- `device`: device attributes supplied by the context source
- `interactions`: seen entries for the message being evaluated

## Presentation Suppression

Use suppression when UI state should temporarily prevent messages from showing,
for example during navigation:

```dart
InAppMessaging.instance.setSuppressed(true, key: 'checkout');
InAppMessaging.instance.setSuppressed(
  false,
  key: 'checkout',
  bufferDuration: const Duration(milliseconds: 500),
);
```

Suppression does not change eligibility and does not create seen entries.

## Persistence

Use `MemoryInteractionSource` for tests and simple integrations. Use the
`in_app_messaging_drift` package when seen entries should be stored in a Drift
database.
