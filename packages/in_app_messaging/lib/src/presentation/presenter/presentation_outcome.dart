import 'dart:async';

/// Reason a selected in-app message was not shown.
enum PresentationNotShownReason {
  /// No presentation handle was registered for the message type.
  missingHandle,

  /// The presentation handle decided not to show the in-app message.
  declined,

  /// The presentation handle failed before the in-app message became visible.
  failed,

  /// Presentation was cancelled before the in-app message became visible.
  cancelled,
}

/// Visibility result for a selected in-app message.
///
/// Only [PresentationShown] means the in-app message became visible and a seen
/// entry may be recorded. [PresentationNotShown] must not create a seen entry.
sealed class PresentationOutcome {
  const PresentationOutcome();

  /// Indicates that the message became visible and may be marked seen.
  const factory PresentationOutcome.shown() = PresentationShown;

  /// Indicates that selection did not result in visible UI.
  const factory PresentationOutcome.notShown(
    PresentationNotShownReason reason,
  ) = PresentationNotShown;

  /// Whether interaction history should record a seen entry.
  bool get isShown => this is PresentationShown;
}

/// Outcome for a message that became visible.
class PresentationShown extends PresentationOutcome {
  const PresentationShown();
}

/// Outcome for a message that did not become visible.
class PresentationNotShown extends PresentationOutcome {
  const PresentationNotShown(this.reason);

  /// Reason no visible presentation happened.
  final PresentationNotShownReason reason;
}

/// Lifecycle of a shown in-app message.
///
/// The presenter keeps the queue occupied until [completed] finishes. Seen
/// entries are recorded when the session is created, not when it completes.
class PresentationSession {
  /// Keeps the presenter occupied until [completed] finishes.
  const PresentationSession({required this.completed});

  /// Allows the presenter to advance the queue immediately.
  factory PresentationSession.immediate() {
    return PresentationSession(completed: Future<void>.value());
  }

  /// Completion signal for the visible surface lifecycle.
  final Future<void> completed;
}

/// Result returned by a presentation handle.
///
/// [PresentationShownAttempt] carries a [PresentationSession] so the presenter
/// can mark the in-app message as shown immediately while waiting to advance
/// the queue until the visible surface closes.
sealed class PresentationAttempt {
  const PresentationAttempt();

  /// Reports visible UI and optionally keeps the queue occupied.
  factory PresentationAttempt.shown({PresentationSession? session}) {
    return PresentationShownAttempt(session ?? PresentationSession.immediate());
  }

  /// Reports that the handle did not show UI.
  const factory PresentationAttempt.notShown(
    PresentationNotShownReason reason,
  ) = PresentationNotShownAttempt;

  /// Outcome returned to [InAppMessaging.trigger].
  PresentationOutcome get outcome;
}

/// Attempt returned when a message became visible.
class PresentationShownAttempt extends PresentationAttempt {
  /// Carries the visible session that owns the queue slot.
  const PresentationShownAttempt(this.session);

  /// Visible UI lifecycle for this attempt.
  final PresentationSession session;

  @override
  PresentationOutcome get outcome => const PresentationOutcome.shown();
}

/// Attempt returned when a message did not become visible.
class PresentationNotShownAttempt extends PresentationAttempt {
  /// Carries the reason UI was not shown.
  const PresentationNotShownAttempt(this.reason);

  /// Reason reported by the presentation handle.
  final PresentationNotShownReason reason;

  @override
  PresentationOutcome get outcome => PresentationOutcome.notShown(reason);
}
