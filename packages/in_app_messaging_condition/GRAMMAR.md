# Condition Expression Grammar

Condition expressions evaluate against a context map and always produce a
boolean result.

## Grammar

The grammar uses ISO-style EBNF. Operators are listed from lowest to highest
precedence by the order in which the productions reference each other.

```ebnf
expression          = orExpression, endOfInput ;

orExpression        = andExpression, { "or", andExpression } ;
andExpression       = notExpression, { "and", notExpression } ;
notExpression       = { "not" }, comparison ;

comparison          = nullFallbackExpression,
                      [ comparisonOperator, nullFallbackExpression ] ;
comparisonOperator  = "=="
                    | "!="
                    | ">"
                    | ">="
                    | "<"
                    | "<="
                    | membershipOperator
                    | "not", membershipOperator ;
membershipOperator  = "contains" | "in" | "matches" ;

nullFallbackExpression
                    = additiveExpression,
                      { "??", additiveExpression } ;
additiveExpression  = multiplicativeExpression,
                      { ( "+" | "-" ), multiplicativeExpression } ;
multiplicativeExpression
                    = unaryExpression,
                      { ( "*" | "/" | "%" ), unaryExpression } ;
unaryExpression     = [ ( "+" | "-" ) ], primary ;

primary             = literal
                    | functionCall
                    | access
                    | "(", orExpression, ")" ;

functionCall        = globalFunctionCall | instanceFunctionCall ;
globalFunctionCall  = identifier, "(", [ argumentList ], ")" ;
instanceFunctionCall
                    = access, ".", identifier,
                      "(", [ argumentList ], ")" ;
argumentList        = orExpression, { ",", orExpression } ;

literal             = nullLiteral
                    | booleanLiteral
                    | numberLiteral
                    | stringLiteral ;

nullLiteral         = "null" ;
booleanLiteral      = "true" | "false" ;
numberLiteral       = digits, [ ".", digits ] ;
stringLiteral       = '"', { stringCharacter | escapeSequence }, '"' ;

access              = identifier,
                      { ".", identifier
                      | "[", ( integerLiteral | stringLiteral ), "]" } ;

identifier          = identifierStart, { identifierPart } ;
identifierStart     = letter | "_" ;
identifierPart      = identifierStart | digit ;
integerLiteral      = digits ;
digits              = digit, { digit } ;

escapeSequence      = "\\", ( '"' | "\\" | "n" | "r" | "t" ) ;
stringCharacter     = ? any character except '"', "\\", or a line break ? ;
letter              = ? ASCII letter A-Z or a-z ? ;
digit               = "0" | "1" | "2" | "3" | "4"
                    | "5" | "6" | "7" | "8" | "9" ;
endOfInput          = ? no remaining non-whitespace characters ? ;
```

Whitespace may appear between tokens. Whitespace is not allowed inside
keywords, numbers, or identifiers.

Comparison operators are not chainable. Write `value >= 1 and value <= 10`
instead of `1 <= value <= 10`.

## Examples

```text
user.plan == "pro"
not user.isBlocked
(user.isPremium or user.isTrial) and device.isMobile
user.plan contains "pro"
user.plan not contains "free"
"premium" in user.tags
"blocked" not in user.tags
user.release matches "^release-[0-9]{4}$"
user.release not matches "-snapshot$"
user.nickname ?? user.name == "Mel"
length(user.tags) >= 2
isEligible(user.plan, cart.subtotal)
audience.isEligible(user.plan)
cart.subtotal + cart.shipping >= 50
progress.completed / progress.total >= 0.75
user.sequence % 2 == 0
interactions.seen_entries[0]
event["product.name"]
event["order-id"]
```

## Evaluation Semantics

### Results and truthiness

Every expression returns `true` or `false`. `and` and `or` do not return one
of their operands.

Values use Python-style truthiness:

- `null`, `false`, numeric zero, empty strings, empty lists, and empty maps are
  false.
- `true`, non-zero numbers, non-empty strings, non-empty lists, and non-empty
  maps are true.

### Context access

Dot access reads identifier-shaped map keys. Bracket access reads list indices
or arbitrary map keys.

A missing key, an out-of-range list index, or access through a value that
cannot contain the requested segment resolves to `null`. Missing values and
explicit `null` values are therefore indistinguishable.

### Boolean operators

`not` negates the truthiness of its operand.

`and` and `or` short-circuit from left to right:

- `and` stops when an operand is false.
- `or` stops when an operand is true.

The right operand is not evaluated after the result is known.

### Null fallback

`??` returns its left operand when that value is not `null`; otherwise it
evaluates and returns its right operand. It short-circuits, so the right operand
is not evaluated when the left operand is available. False, zero, and empty
strings or collections do not trigger the fallback.

Null fallback has lower precedence than arithmetic and higher precedence than
comparison. For example, `nickname ?? name == "Mel"` compares the selected name
with `"Mel"`.

### Comparisons

Equality does not coerce strings, booleans, and numbers. For example,
`1 == "1"` is false. Integer and decimal values are both numbers and compare
numerically.

Ordering operators compare numbers. Operands that cannot be compared evaluate
to false.

`contains` tests whether its right operand is contained in its left operand.
It supports substrings, list elements, and map keys. `in` performs the inverse
operation.

`matches` applies the regular expression in its right string operand to its
left string operand. A match may occur anywhere unless the pattern uses
anchors such as `^` and `$`.

`not contains`, `not in`, and `not matches` negate their corresponding
membership comparison. For example, `value not in values` is equivalent to
`not (value in values)`.

A comparison operator applied to unsupported operand types evaluates to false.

### Arithmetic

`+`, `-`, `*`, `/`, and `%` provide arithmetic for numbers and values represented
by a `ConditionObject`. Unary `+` preserves a number and unary `-` negates it;
custom values may define both unary operations. Multiplication, division, and
remainder have higher precedence than addition and subtraction. Operators at
the same precedence are evaluated from left to right.

Arithmetic does not coerce strings, booleans, or other values to numbers. When
the left operand is a custom value, the operation is delegated to its
`ConditionObject`, which may return any supported expression value. An
unsupported operation or division by zero produces `null`. That value is false
by itself and causes a subsequent comparison or arithmetic operation to
evaluate to false or `null`, respectively.

### Functions

Function calls use the same syntax for built-in and application-defined
functions. Function names are identifiers. Calls accept zero or more
comma-separated expressions, which are evaluated eagerly from left to right. A
function may return any supported expression value.

The evaluation context resolves function names. Application-defined functions
take precedence over built-ins with the same name, allowing a context to
replace built-in behavior deliberately. Calling an unknown function is an
authoring error.

An instance function call resolves its receiver through context access and
delegates function lookup to the receiver's `ConditionObject`. For example,
`audience.isEligible(user.plan)` invokes `isEligible` on the value at
`audience`. Calling a function that the receiver does not expose is an authoring
error.

The built-in `length(value)` function returns the number of characters in a
string or the number of entries in a list, set, or map. Unsupported values or
an argument count other than one produce `null`.

## Errors

Empty input, malformed expressions, trailing tokens, unterminated strings,
and invalid regular expressions are authoring errors and throw a
`FormatException` with a source offset when available. They do not silently
evaluate to false.

Applications may catch and report these errors at their configuration
boundary, then suppress the affected message. The evaluator itself does not
emit warnings or hide invalid expressions.
