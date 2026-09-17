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

comparison          = primary, [ comparisonOperator, primary ] ;
comparisonOperator  = "=="
                    | "!="
                    | ">"
                    | ">="
                    | "<"
                    | "<="
                    | "contains"
                    | "in"
                    | "matches" ;

primary             = literal
                    | access
                    | "(", orExpression, ")" ;

literal             = nullLiteral
                    | booleanLiteral
                    | numberLiteral
                    | stringLiteral ;

nullLiteral         = "null" ;
booleanLiteral      = "true" | "false" ;
numberLiteral       = [ "-" ], digits, [ ".", digits ] ;
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
"premium" in user.tags
user.release matches "^release-[0-9]{4}$"
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

An operator applied to unsupported operand types evaluates to false.

## Errors

Empty input, malformed expressions, trailing tokens, unterminated strings,
and invalid regular expressions are authoring errors and throw a
`FormatException` with a source offset when available. They do not silently
evaluate to false.

Applications may catch and report these errors at their configuration
boundary, then suppress the affected message. The evaluator itself does not
emit warnings or hide invalid expressions.
