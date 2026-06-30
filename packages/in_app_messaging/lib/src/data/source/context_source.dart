/// Supplies non-event data used by message conditions.
abstract interface class ContextSource {
  /// Current user, device, and environment data merged into condition input.
  Map<String, dynamic> get context;
}
