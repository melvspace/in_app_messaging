# In-App Messaging Drift

Drift adapter for `in_app_messaging` interaction history.

This package implements `InteractionSource` with a Drift database. Its stable
responsibility is storing seen entries and reading the interaction history used
by conditions such as `OnceCondition`, `OncePerDayCondition`, and
`OncePerEventPropertiesCondition`.

It does not currently own message definitions, user attributes, device
attributes, or static message placement state.

## Usage

Create the database and pass the DAO to `DriftInteractionSource`:

```dart
final database = InAppMessagingDatabase();

final messaging = InAppMessaging.initialize(
  gateway: DefaultMessageGateway(
    messageSource: myMessageSource,
    interactionSource: DriftInteractionSource(
      dao: database.inAppMessagingDao,
    ),
    contextSource: myContextSource,
  ),
);
```

When presentation reports that a message was shown, the core package calls
`markSeen`. The Drift source stores:

- message id
- seen date
- triggering event name, when available
- triggering event properties, when serializable

## Database Generation

Regenerate Drift code, schema JSON, migration helpers, and generated migration
test schemas from the workspace root:

```bash
dart run melos generate:drift
```

Generated Drift files are outputs. Change the schema/source files and regenerate
instead of editing generated files directly.
