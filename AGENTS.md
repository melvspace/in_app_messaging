# Repository Guidelines

## Project Context

This repository is a Dart/Flutter workspace for in-app messaging packages. Act as a senior Dart and Flutter engineer: keep changes boring, explicit, testable, and maintainable. Apply SOLID, KISS, and DRY with judgment. Prefer small cohesive modules, narrow contracts, stable dependency direction, and meaningful reuse. Do not introduce clever abstractions that hide message evaluation, persistence, or presentation behavior.

## Source Of Truth

- Start with existing code, nearby tests, package READMEs, and the relevant `pubspec.yaml` before inventing a pattern.
- Treat the root `pubspec.yaml` `workspace:` list as authoritative. Add packages explicitly; do not use wildcards.
- Treat generated files as outputs. Do not hand-edit `*.g.dart`, `*.freezed.dart`, `*.drift.dart`, Drift schema helpers, or Flutter generated registrants. Change the source model/schema and regenerate.
- Do not change package ownership, public API direction, or database schema rules as a side effect. If a task requires that, call it out clearly.

## Project Structure & Module Organization

- `packages/in_app_messaging/` is the core Flutter package. Public API starts at `lib/in_app_messaging.dart`; implementation belongs under `lib/src/core`, `data`, `domain`, and `presentation`.
- `packages/in_app_messaging_json_logic/` is the pure Dart JsonLogic engine with examples, compliance fixtures, and package-level Make targets.
- `packages/in_app_messaging_drift/` is the Drift persistence adapter with schema, migrations, and generated migration test schemas.
- `apps/sandbox/` is the Flutter sandbox app for manual integration checks.
- `docs/` stores project planning notes. Tests live in each package's `test/` directory.

Dependency direction must stay stable: the Drift adapter depends on the core package; the core package depends on the JsonLogic package; JsonLogic stays independent of Flutter and persistence; the sandbox may consume workspace packages. Avoid relative `path:` dependencies inside workspace packages unless the repo already establishes that pattern.

## Engineering Standards

- Keep responsibilities separated: domain entities and contracts model behavior; data sources adapt storage or in-memory state; presentation widgets render and collect user intent.
- Prefer typed Dart APIs over dynamic maps, stringly typed contracts, global mutable state, or hidden side effects.
- Apply DRY only to proven concepts. Do not add broad helpers to remove minor local duplication when locality is clearer.
- Apply KISS by choosing direct control flow, explicit names, and local reasoning over framework-heavy or reflection-like solutions.
- Apply SOLID by keeping public interfaces narrow, implementations replaceable, and package dependencies pointed inward toward stable contracts.
- Preserve invariants instead of adding defensive fallbacks everywhere. Validate at boundaries and rely on internal contracts after that.
- Avoid workaround layers, compatibility shims for unshipped code, undocumented flags, private API calls, and environment-specific hacks.
- Keep public contracts readable. Add doc comments when lifecycle, units, persistence semantics, or error behavior are not obvious.
- Write doc comments for every public Dart member in package sources. Keep them precise and behavior-focused.
  Explain product semantics, lifecycle, units, persistence meaning, side effects, and error behavior; avoid restating the signature or exposing implementation details.

## Build, Test, and Development Commands

- `dart pub get` resolves workspace dependencies.
- `dart run melos test` runs Flutter tests for Flutter packages and Dart tests for non-Flutter packages.
- `dart run melos generate` runs `build_runner build -d` for packages that use code generation.
- `dart run melos generate:drift` rebuilds Drift database code, schema JSON, migration helpers, and generated migration tests.
- `dart run melos exec --flutter -- flutter analyze` analyzes Flutter packages.
- `dart run melos exec --no-flutter -- dart analyze` analyzes pure Dart packages.
- `cd apps/sandbox && fvm flutter run` starts the sandbox app using the configured FVM Flutter channel.

Use FVM for Flutter commands when working in the sandbox or Flutter packages. After `pubspec.yaml`, generated model, Drift schema, or migration changes, run the matching generation and analysis commands before considering the work complete.

## Coding Style & Naming Conventions

Use `dart format .` before submitting changes. Flutter packages include `package:flutter_lints/flutter.yaml`; pure Dart packages use `package:lints/recommended.yaml`. Follow Dart conventions: two-space indentation, `UpperCamelCase` types, `lowerCamelCase` members, and `snake_case.dart` filenames. Keep package entrypoints focused on public exports and leave implementation details under `lib/src/`.

## Testing Guidelines

Use `package:test`, `flutter_test`, and `checks` where already present. Name test files `*_test.dart` and group cases around behavior, for example `conditions_test.dart`, `trigger_test.dart`, or `jsonlogic_test.dart`. Test behavior that can regress: condition evaluation, trigger logic, JsonLogic operators, presenter coordination, data source behavior, and Drift migrations. Avoid mirror tests for generated code or constant-only stubs. The JsonLogic package supports `make coverage`; there is no repository-wide coverage gate.

## Commit & Pull Request Guidelines

Recent history uses Conventional Commit-style subjects: `feat:`, `fix:`, `chore:`, and scoped variants such as `chore(release):` or `feat(deps):`. Keep commits focused and mention generated files when they are intentionally updated.

Pull requests should describe the affected package, summarize behavior changes, link related issues, and list commands run. Add screenshots or short recordings for sandbox or presentation changes. For Drift changes, call out schema versions, migration files, and generated test schemas explicitly.

## Repo Hygiene

Keep secrets, machine-local state, build outputs, coverage reports, and IDE-private files out of commits. Before finishing, check the working tree and distinguish your changes from pre-existing user changes. Never revert unrelated work.
