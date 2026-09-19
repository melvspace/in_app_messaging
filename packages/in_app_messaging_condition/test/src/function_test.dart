import 'package:in_app_messaging_condition/in_app_messaging_condition.dart';
import 'package:test/test.dart';

class Audience extends ConditionObject {
  Audience(this.eligiblePlans);

  final Set<String> eligiblePlans;

  @override
  ConditionFunction? resolveFunction(String name) {
    return switch (name) {
      'isEligible' => (arguments) => switch (arguments) {
            [final String plan] => eligiblePlans.contains(plan),
            _ => false,
          },
      _ => null,
    };
  }
}

void main() {
  group('built-in functions', () {
    final cases = [
      ('length("hello") == 5', true),
      ('length(items) == 2', true),
      ('length(items) > 2', false),
    ];

    for (final (condition, expected) in cases) {
      test('$condition is $expected', () {
        final result = eval(
          condition,
          ConditionContext(
            values: {
              'items': [1, 2],
            },
          ),
        );

        expect(result, expected);
      });
    }

    test('resolves length from the default registry', () {
      final function = const ConditionContext().resolveFunction('length');

      expect(function, isNotNull);
      expect(function!(['hello']), 5);
      expect(
        function([
          <Object?>[1, 2],
        ]),
        2,
      );
      expect(
        function([
          {1, 2},
        ]),
        2,
      );
      expect(
        function([
          {'one': 1},
        ]),
        1,
      );
      expect(function([null]), isNull);
      expect(function([]), isNull);
    });
  });

  group('custom functions', () {
    bool isEligible(List<Object?> arguments) {
      return switch (arguments) {
        [final String plan, final num subtotal] => plan == 'pro' && subtotal >= 50,
        _ => false,
      };
    }

    final context = ConditionContext(
      values: const {'plan': 'pro', 'subtotal': 75},
      functions: {'isEligible': isEligible},
    );

    test('resolves a registered function', () {
      final function = context.resolveFunction('isEligible');

      expect(function, same(isEligible));
      expect(function!(['pro', 75]), isTrue);
      expect(context.resolveFunction('unknown'), isNull);
    });

    test('calls a registered function from an expression', () {
      expect(eval('isEligible(plan, subtotal)', context), isTrue);
    });

    test('custom functions take precedence over built-ins', () {
      final overridden = ConditionContext(
        functions: {'length': (_) => 42},
      );

      expect(overridden.resolveFunction('length')!([1]), 42);
    });
  });

  group('instance functions', () {
    final audience = Audience({'pro'});

    test('resolves a receiver-bound function', () {
      final function = audience.resolveFunction('isEligible');

      expect(function, isNotNull);
      expect(function!(['pro']), isTrue);
      expect(function(['free']), isFalse);
      expect(audience.resolveFunction('unknown'), isNull);
    });

    test('calls a function on a context value', () {
      final context = ConditionContext(
        values: {'audience': audience, 'plan': 'pro'},
      );

      expect(eval('audience.isEligible(plan)', context), isTrue);
    });
  });
}
