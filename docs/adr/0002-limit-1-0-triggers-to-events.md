# Limit 1.0 triggers to events

For 1.0, triggered in-app messages are started only by event triggers. Cron and event-sequence triggers are excluded from the stable public API because their scheduling, persistence, and ordering semantics are not settled. Shipping only event-triggered behavior keeps the first stable release testable while leaving scheduled and sequence triggers available for later design.
