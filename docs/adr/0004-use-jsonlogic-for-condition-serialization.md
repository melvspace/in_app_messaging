# Use JsonLogic for condition serialization

Conditions are serialized as JsonLogic for the 1.0 API. This keeps in-app message configuration portable across remote and local sources while allowing the package to offer typed condition builders for common cases. The trade-off is that the serialized condition contract is less type-safe than a Dart-only DSL, but it fits externally supplied message configuration better.
