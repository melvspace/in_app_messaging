// ignore_for_file: experimental_member_use

import 'package:in_app_messaging/in_app_messaging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sandbox/features/iam/presentation/handles/dialog_message_handle/dialog_message_handle.dart';
import 'package:sandbox/features/iam/presentation/handles/transient_message_handle/transient_message_handle.dart';

part 'messages.g.dart';

/// Application events used by the sandbox's realistic showcase flows.
abstract final class ShowcaseEvents {
  /// Emitted after the storefront becomes visible.
  static const appOpened = 'app_opened';

  /// Emitted when the member offer is opened.
  static const offerOpened = 'offer_opened';

  /// Emitted when a featured product is added to the cart.
  static const itemAdded = 'item_added';

  /// Emitted when a product is saved for later.
  static const productSaved = 'product_saved';

  /// Emitted after delivery availability is checked.
  static const deliveryChecked = 'delivery_checked';

  /// Emitted when checkout begins.
  static const checkoutStarted = 'checkout_started';

  /// Emitted when the demo order completes.
  static const orderCompleted = 'order_completed';

  /// Emitted when the weekend collection is browsed.
  static const weekendCollectionViewed = 'weekend_collection_viewed';

  /// Emitted when the weekend bundle is added after browsing.
  static const weekendBundleAdded = 'weekend_bundle_added';
}

@riverpod
List<Message> iamMessages(Ref ref) {
  final campaignStart = DateTime.utc(2025);

  return [
    SimpleMessage(
      id: 'storefront_welcome',
      enabled: true,
      type: DialogMessageHandle.kType,
      start: campaignStart,
      triggers: const [MessageTrigger.event(event: ShowcaseEvents.appOpened)],
      condition: 'interactions.last_seen == null',
      data: const {
        'title': 'A little welcome gift',
        'body': 'Take 15% off your first Northstar order today. Your member '
            'discount will be ready at checkout.',
        'actions': [
          {'text': 'Start shopping', 'click': <String, dynamic>{}},
        ],
      },
    ),
    SimpleMessage(
      id: 'member_weekend_offer',
      enabled: true,
      type: DialogMessageHandle.kType,
      start: campaignStart,
      triggers: const [MessageTrigger.event(event: ShowcaseEvents.offerOpened)],
      condition: 'user.membership == "plus" and device.language == "en" '
          'and length(interactions.seen_entries) < 2',
      data: const {
        'title': 'Member weekend starts now',
        'body': 'Save 20% on pantry favorites through Sunday. The offer is '
            'automatically applied to eligible items.',
        'actions': [
          {'text': 'Shop the edit', 'click': <String, dynamic>{}},
          {'text': 'Maybe later', 'click': <String, dynamic>{}},
        ],
      },
    ),
    SimpleMessage(
      id: 'free_shipping_progress',
      enabled: true,
      type: TransientMessageHandle.bannerType,
      start: campaignStart,
      triggers: const [
        MessageTrigger.event(
          event: ShowcaseEvents.itemAdded,
          data: {'source': 'featured'},
        ),
      ],
      condition: 'event.source == "featured" and event.cartTotal >= 40',
      data: const {
        'title': r'You are $18 away from free delivery',
        'body': 'Add one more pantry favorite and delivery is on us.',
        'actionLabel': 'Got it',
      },
    ),
    SimpleMessage(
      id: 'saved_item_confirmation',
      enabled: true,
      type: TransientMessageHandle.notificationType,
      start: campaignStart,
      triggers: const [
        MessageTrigger.event(event: ShowcaseEvents.productSaved),
      ],
      condition: 'interactions.last_seen == null or '
          'interactions.last_seen.trigger_properties.productId != '
          'event.productId',
      data: const {
        'title': 'Saved for later',
        'body': 'We added the item to your favorites.',
      },
    ),
    SimpleMessage(
      id: 'delivery_area_confirmation',
      enabled: true,
      type: TransientMessageHandle.bannerType,
      start: campaignStart,
      triggers: const [
        MessageTrigger.event(event: ShowcaseEvents.deliveryChecked),
      ],
      condition: r'event.postalCode matches "^94[0-9]{3}$" '
          'and device.platform == "android"',
      data: const {
        'title': 'Delivery is available in your area',
        'body': 'Order in the next 2 hours for a 6-8 PM delivery window.',
        'actionLabel': 'Perfect',
      },
    ),
    SimpleMessage(
      id: 'secure_checkout_reassurance',
      enabled: true,
      type: TransientMessageHandle.notificationType,
      start: campaignStart,
      triggers: const [
        MessageTrigger.event(event: ShowcaseEvents.checkoutStarted),
      ],
      condition: 'user.tags contains "early-access" and '
          'device.version == "1.0.0"',
      data: const {
        'title': 'Your cart is reserved',
        'body': 'Items are held for 10 minutes while you check out.',
      },
    ),
    SimpleMessage(
      id: 'demo_order_confirmation',
      enabled: true,
      type: DialogMessageHandle.kType,
      start: campaignStart,
      triggers: const [
        MessageTrigger.event(event: ShowcaseEvents.orderCompleted),
      ],
      condition: 'event.total >= 50 and '
          '(user.tier == "gold" or user.tier == "platinum")',
      data: const {
        'title': 'Order confirmed',
        'body': 'Thanks, Maya. Your order #NS-2048 is being packed and will '
            'arrive between 6 and 8 PM.',
        'actions': [
          {'text': 'Track order', 'click': <String, dynamic>{}},
        ],
      },
    ),
    SimpleMessage(
      id: 'weekend_bundle_follow_up',
      enabled: true,
      type: TransientMessageHandle.notificationType,
      start: campaignStart,
      triggers: const [
        MessageTrigger.eventSequence(
          events: [
            EventSequenceItem(name: ShowcaseEvents.weekendCollectionViewed),
            EventSequenceItem(name: ShowcaseEvents.weekendBundleAdded),
          ],
          data: [{}, {}],
        ),
      ],
      condition: 'event.event_name == "weekend_bundle_added"',
      data: const {
        'title': 'Weekend bundle added',
        'body': 'Your recently viewed collection is now in the cart.',
      },
    ),
  ];
}
