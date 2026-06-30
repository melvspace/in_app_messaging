# In-App Messaging

This context defines the language for deciding when configured in-app content is eligible to be shown and how that decision is recorded.

## Language

**In-App Message**:
A configured unit of in-app content, eligibility rules, timing, and presentation metadata that may be shown to a user.
_Avoid_: Message, notification, campaign, prompt

**Host Application**:
The application that embeds the SDK, reports events, supplies or connects message sources, and configures presentation.
_Avoid_: Client, consumer, app

**Triggered In-App Message**:
An in-app message whose evaluation starts from an event.
_Avoid_: Dynamic message

**Static In-App Message**:
An in-app message whose eligibility is checked without a specific event, usually for a persistent surface or named placement.
_Avoid_: In-app widget, slot message

**Event**:
An application occurrence reported to the SDK with a name and optional properties.
_Avoid_: Trigger, action, signal

**Event Properties**:
Structured values attached to an event when the application reports it to the SDK.
_Avoid_: Payload, trigger properties, data

**Trigger**:
A configured rule on an in-app message that identifies which events can start eligibility evaluation for that message.
_Avoid_: Event, action

**Event Trigger**:
A trigger that matches a reported event by name and optional event properties. Configured event properties use exact equality; more expressive comparisons belong in conditions.
_Avoid_: Event, signal

**Condition**:
An eligibility rule evaluated after a trigger matches, using the evaluation context.
_Avoid_: Filter, criteria, segment

**Eligibility**:
The state of an in-app message being allowed for the current evaluation after its enabled state, timing, trigger or placement, and condition requirements pass.
_Avoid_: Availability, visibility, match

**Evaluation Context**:
The data available while evaluating a condition, including available event properties or placement information, user attributes, device attributes, and interaction history.
_Avoid_: Context, user context, device context

**Seen Entry**:
A stored record that an in-app message was actually shown and should count toward future eligibility decisions.
_Avoid_: Interaction, delivery, impression

**Interaction History**:
The accumulated records for a specific in-app message that conditions can use when deciding future eligibility.
_Avoid_: Interactions, seen dates

**Evaluation**:
The process that determines which in-app messages are eligible for an event or placement.
_Avoid_: Presentation, rendering, delivery

**Priority**:
The ordering value used to choose between eligible in-app messages for the same evaluation. Lower values win.
_Avoid_: Weight, rank, score

**Presentation**:
The process that decides whether and how a selected in-app message is shown in Flutter.
_Avoid_: Evaluation, triggering, rendering

**Suppression**:
A temporary presentation state that prevents queued in-app messages from being shown without changing evaluation results or creating seen entries.
_Avoid_: Pause, disable, cancellation

**Message Source**:
The source that supplies configured in-app messages for evaluation.
_Avoid_: Repository, provider, storage

**Interaction Source**:
The source that records and retrieves interaction history for in-app messages.
_Avoid_: Analytics, database, persistence adapter

**Message Type**:
The category of an in-app message used to select its presentation handler.
_Avoid_: Template, view, widget

**Placement**:
A named application surface where static in-app messages are evaluated and may be shown.
_Avoid_: Slot, widget
