# In-App Messaging Workspace

Dart and Flutter workspace for trigger-driven in-app messaging packages.

This repository contains the core Flutter SDK, a pure Dart JsonLogic engine,
and a Drift-backed interaction history adapter. The stable package boundary is:
JsonLogic stays independent, the core package owns evaluation and presentation
contracts, and adapters plug into the core package through narrow source
interfaces.

## Packages

| Package | Purpose |
| --- | --- |
| [`in_app_messaging`](packages/in_app_messaging) | Core Flutter package for evaluating and presenting in-app messages. |
| [`in_app_messaging_drift`](packages/in_app_messaging_drift) | Drift adapter for storing seen entries and reading interaction history. |
| [`in_app_messaging_json_logic`](packages/in_app_messaging_json_logic) | Pure Dart JsonLogic implementation used by conditions. |
| [`apps/sandbox`](apps/sandbox) | Flutter sandbox for manual integration checks. |

## Current Scope

The stable path is event-triggered in-app messaging:

1. The host application reports an event.
2. The core package loads configured in-app messages from a message source.
3. Evaluation checks enabled state, timing, event triggers, conditions, and
   priority.
4. Presentation shows at most one selected in-app message.
5. A seen entry is recorded only after presentation reports that the message was
   actually shown.

Static in-app messages and placements are part of the domain model, but they are
not stable public API yet.

## Repository Context

- [`CONTEXT.md`](CONTEXT.md) defines the shared domain language.
- [`docs/adr`](docs/adr) records durable architecture decisions.

## Development

Resolve workspace dependencies:

```bash
dart pub get
```

Run all tests:

```bash
dart run melos test
```

Run code generation:

```bash
dart run melos generate
```

Regenerate Drift database files and migration helpers:

```bash
dart run melos generate:drift
```

Analyze Flutter packages:

```bash
dart run melos exec --flutter -- flutter analyze
```

Analyze pure Dart packages:

```bash
dart run melos exec --no-flutter -- dart analyze
```

Run the sandbox:

```bash
cd apps/sandbox
fvm flutter run
```

## Generated Files

Generated Dart, Freezed, JsonSerializable, Drift schema, and Flutter registrant
files are outputs. Update the source models or schemas and regenerate instead
of editing generated files by hand.
