# Keep context mutation out of 1.0 interfaces

The 1.0 public interfaces do not expose methods for mutating evaluation context. Current unimplemented user and device property setters should be removed rather than stabilized because static message evaluation and context ownership are not fully designed. Context mutation can be introduced later with a deliberate contract once the use cases and persistence expectations are clear.
