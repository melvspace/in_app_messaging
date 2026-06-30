# Keep in-app messaging packages on stable dependency boundaries

The workspace is split into a Flutter core package, a pure Dart JsonLogic package, and a Drift persistence adapter. The JsonLogic package stays independent of Flutter and persistence, the core package depends on JsonLogic for condition evaluation, and the Drift adapter depends on the core package for interaction contracts. This keeps rule evaluation reusable, persistence replaceable, and presentation behavior owned by the Flutter package.
