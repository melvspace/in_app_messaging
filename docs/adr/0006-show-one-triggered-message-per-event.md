# Show one triggered message per event

The triggered in-app message flow presents at most one in-app message for each reported event. Evaluation may find multiple eligible messages, but priority chooses the single message to pass to presentation. This keeps event-triggered behavior predictable and avoids stacking multiple messages from one application action.
