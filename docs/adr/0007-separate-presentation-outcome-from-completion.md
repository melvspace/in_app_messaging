# Separate presentation outcome from presentation completion

Presentation handles return a presentation attempt that distinguishes an in-app message becoming visible from the visible surface finishing. A shown presentation outcome creates a seen entry as soon as the in-app message becomes visible to the user, while presentation session completion only controls when the presenter may advance the queue. This keeps interaction history accurate without stacking queued in-app messages on top of an active presentation surface.
