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

/// Result of attempting presentation for a selected in-app message.
///
/// Only [PresentationShown] means the in-app message became visible and a seen
/// entry may be recorded. [PresentationNotShown] must not create a seen entry.
sealed class PresentationOutcome {
  const PresentationOutcome();

  const factory PresentationOutcome.shown() = PresentationShown;

  const factory PresentationOutcome.notShown(
    PresentationNotShownReason reason,
  ) = PresentationNotShown;

  bool get isShown => this is PresentationShown;
}

class PresentationShown extends PresentationOutcome {
  const PresentationShown();
}

class PresentationNotShown extends PresentationOutcome {
  const PresentationNotShown(this.reason);

  final PresentationNotShownReason reason;
}

/// Lifecycle of a shown in-app message.
///
/// The presenter keeps the queue occupied until [completed] finishes. Seen
/// entries are recorded when the session is created, not when it completes.
class PresentationSession {
  const PresentationSession({required this.completed});

  factory PresentationSession.immediate() {
    return PresentationSession(completed: Future<void>.value());
  }

  final Future<void> completed;
}

/// Result returned by a presentation handle.
///
/// [PresentationShownAttempt] carries a [PresentationSession] so the presenter
/// can mark the in-app message as shown immediately while waiting to advance
/// the queue until the visible surface closes.
sealed class PresentationAttempt {
  const PresentationAttempt();

  factory PresentationAttempt.shown({PresentationSession? session}) {
    return PresentationShownAttempt(session ?? PresentationSession.immediate());
  }

  const factory PresentationAttempt.notShown(
    PresentationNotShownReason reason,
  ) = PresentationNotShownAttempt;

  PresentationOutcome get outcome;
}

class PresentationShownAttempt extends PresentationAttempt {
  const PresentationShownAttempt(this.session);

  final PresentationSession session;

  @override
  PresentationOutcome get outcome => const PresentationOutcome.shown();
}

class PresentationNotShownAttempt extends PresentationAttempt {
  const PresentationNotShownAttempt(this.reason);

  final PresentationNotShownReason reason;

  @override
  PresentationOutcome get outcome => PresentationOutcome.notShown(reason);
}
