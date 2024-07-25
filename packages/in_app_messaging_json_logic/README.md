# In-app Messaging - Json Logic

This is extended fork of [jsonlogic](https://github.com/vikesh-raj/jsonlogic)

JsonLogic not actively maintained, so I've created this fork to maintain it and add some features that are not included in the original package.

# JsonLogic

Jsonlogic is dart package that evaluates the json logic rules(logic) with
the give data.

This is a dart port for the [JSON logic javascript](https://github.com/jwadhams/json-logic-js) package.

It passes the compliance tests for the JSON logic tests.

Usage:

Sample example from jsonlogic website.

`The pie isn’t ready to eat unless it’s cooler than 110 degrees, and filled with apples.`

This can be encoded in the following JSON logic rule.

```dart
  var jl = Jsonlogic();
  var rule = {
    "and": [
      {
        "<": [
          {"var": "temp"},
          110
        ]
      },
      {
        "==": [
          {"var": "pie.filling"},
          "apple"
        ]
      }
    ]
  };
  var data = {
    "temp": 100,
    "pie": {"filling": "apple"}
  };
  var answer = jl.apply(rule, data);
  print('example1 answer = $answer');
```
