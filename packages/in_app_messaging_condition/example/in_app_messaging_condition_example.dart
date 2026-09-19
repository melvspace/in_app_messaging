import 'package:in_app_messaging_condition/in_app_messaging_condition.dart';

void main() {
  final enabledExperiments = {'checkout-v2', 'loyalty-banner'};
  final user = _UserAudience(
    id: 'user-1842',
    plan: 'pro',
    tags: {'beta', 'high-intent'},
    experiments: {'checkout-v2'},
    lastSeenDays: 2,
  );
  final context = ConditionContext(
    values: {
      'user': user,
      'device': {'platform': 'ios'},
      'cart': {'subtotal': 44.50, 'shipping': 5.50},
      'now': DateTime.utc(2026, 9, 18, 12),
      'campaign': {
        'startsAt': DateTime.utc(2026, 9, 1),
        'endsAt': DateTime.utc(2026, 10, 1),
      },
      'blockedPlatforms': ['web'],
    },
    functions: {
      'isExperimentEnabled': (arguments) => switch (arguments) {
            [final String experiment] => enabledExperiments.contains(experiment),
            _ => false,
          },
    },
  );

  print('User: ${user.id}');
  print('Plan: ${user.plan}');
  print('Tags: ${user.tags.join(', ')}');
  print('Experiments: ${user.experiments.join(', ')}');
  print('Last seen: ${user.lastSeenDays} days ago');
  print('');

  final messageRules = {
    'Pro beta upsell': 'user.plan == "pro" and user.hasTag("beta")',
    'Free shipping reminder': 'cart.subtotal + (cart.shipping ?? 0) >= 50',
    'Checkout experiment': '"checkout-v2" in user.experiments '
        'and isExperimentEnabled("checkout-v2")',
    'Recently active mobile user': 'user.lastSeenDays <= 7 '
        'and device.platform not in blockedPlatforms',
    'Active campaign window': 'now >= campaign.startsAt and now < campaign.endsAt',
    'User has experiments': 'length(user.experiments) > 0',
  };

  for (final MapEntry(key: message, value: condition) in messageRules.entries) {
    print('$message: ${eval(condition, context)}');
  }
}

class _UserAudience extends ConditionObject {
  _UserAudience({
    required this.id,
    required this.plan,
    required this.tags,
    required this.experiments,
    required this.lastSeenDays,
  });

  final String id;
  final String plan;
  final Set<String> tags;
  final Set<String> experiments;
  final int lastSeenDays;

  @override
  Object? accessKey(String key) => switch (key) {
        'id' => id,
        'plan' => plan,
        'experiments' => experiments,
        'lastSeenDays' => lastSeenDays,
        _ => null,
      };

  @override
  ConditionFunction? resolveFunction(String name) => switch (name) {
        'hasTag' => (arguments) => switch (arguments) {
              [final String tag] => tags.contains(tag),
              _ => false,
            },
        _ => null,
      };
}
