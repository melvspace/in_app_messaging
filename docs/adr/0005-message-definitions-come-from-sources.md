# Message definitions come from sources

The SDK does not own authoring or management of in-app message definitions. Host applications or backends supply configured in-app messages through a message source, while the SDK owns evaluation, presentation coordination, and interaction history. This keeps campaign management and remote authoring concerns outside the core package until there is a deliberate product need for them.
