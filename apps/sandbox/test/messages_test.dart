import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sandbox/providers/messages.dart';

void main() {
  test('showcase campaigns cover varied condition strategies', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    final messages = container.read(iamMessagesProvider);
    final conditions = {
      for (final message in messages) message.id: message.condition
    };

    expect(conditions, hasLength(8));
    expect(conditions.values, everyElement(isA<String>()));
    expect(
      conditions['storefront_welcome'],
      'interactions.last_seen == null',
    );
    expect(conditions['member_weekend_offer'], isA<String>());
    expect(
      conditions['free_shipping_progress'],
      contains('event.cartTotal >= 40'),
    );
    expect(
      conditions['saved_item_confirmation'],
      contains('trigger_properties.productId'),
    );
    expect(
      conditions['delivery_area_confirmation'],
      contains('event.postalCode matches'),
    );
    expect(
      conditions['secure_checkout_reassurance'],
      contains('user.tags contains "early-access"'),
    );
    expect(
        conditions['demo_order_confirmation'], contains('event.total >= 50'));
    expect(
      conditions['weekend_bundle_follow_up'],
      'event.event_name == "weekend_bundle_added"',
    );
  });
}
