import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:in_app_messaging/in_app_messaging.dart';
import 'package:sandbox/features/iam/presentation/handles/dialog_message_handle/dialog_message_handle.dart';
import 'package:sandbox/features/iam/presentation/handles/transient_message_handle/transient_message_handle.dart';
import 'package:sandbox/providers/database.dart';
import 'package:sandbox/providers/in_app_messaging.dart';
import 'package:sandbox/providers/messages.dart';
import 'package:sandbox/providers/navigator.dart';

Future<void> main() async {
  runApp(
    const ProviderScope(
      child: _EagerInitialization(
        child: MainApp(),
      ),
    ),
  );
}

/// Root application for the interactive in-app messaging showcase.
class MainApp extends ConsumerWidget {
  /// Creates the sandbox application.
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigatorKey = ref.watch(navigatorProvider);

    return DynamicMessagePresenter(
      navigatorKey: navigatorKey,
      initiallySuppressed: false,
      builders: {
        ...DialogMessageHandle.kFactories,
        ...TransientMessageHandle.factories,
      },
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'Northstar Market',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFFB85C2D),
            brightness: Brightness.light,
            surface: const Color(0xFFFFFBF6),
          ),
          scaffoldBackgroundColor: const Color(0xFFF6F1E9),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFFF6F1E9),
            surfaceTintColor: Colors.transparent,
          ),
          cardTheme: const CardThemeData(
            color: Color(0xFFFFFBF6),
            surfaceTintColor: Colors.transparent,
            elevation: 0,
            margin: EdgeInsets.zero,
          ),
          dialogTheme: const DialogThemeData(
            backgroundColor: Color(0xFFFFFBF6),
            surfaceTintColor: Colors.transparent,
          ),
        ),
        home: const _StorefrontPage(),
      ),
    );
  }
}

class _StorefrontPage extends ConsumerStatefulWidget {
  const _StorefrontPage();

  @override
  ConsumerState<_StorefrontPage> createState() => _StorefrontPageState();
}

class _StorefrontPageState extends ConsumerState<_StorefrontPage> {
  int _cartItems = 2;
  String _activity = 'Campaigns are ready';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(_trigger(ShowcaseEvents.appOpened));
    });
  }

  Future<void> _trigger(
    String event, [
    Map<String, dynamic> properties = const {},
  ]) async {
    final shown = await InAppMessaging.instance.trigger(event, properties);
    if (!mounted) return;
    setState(() {
      _activity = shown ? 'Campaign shown for $event' : 'Event sent: $event';
    });
  }

  Future<void> _addFeaturedItem() async {
    setState(() => _cartItems += 1);
    await _trigger(
      ShowcaseEvents.itemAdded,
      const {'source': 'featured', 'cartTotal': 42},
    );
  }

  Future<void> _resetCampaigns() async {
    final dao = ref.read(databaseProvider).inAppMessagingDao;
    await dao.delete(dao.inAppMessageSeenDates).go();
    await dao.delete(dao.inAppMessageInteractions).go();
    if (!mounted) return;

    setState(() => _activity = 'Campaign history cleared');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text('Campaign history cleared. Scenarios can be replayed.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 20,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _BrandMark(),
            SizedBox(width: 10),
            Text('Northstar Market'),
          ],
        ),
        actions: [
          IconButton(
            tooltip: 'Reset campaign history',
            onPressed: _resetCampaigns,
            icon: const Icon(Icons.restart_alt),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Badge(
              label: Text('$_cartItems'),
              child: const Icon(Icons.shopping_bag_outlined),
            ),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final wide = constraints.maxWidth >= 820;
          return CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.fromLTRB(
                  wide ? 32 : 16,
                  16,
                  wide ? 32 : 16,
                  40,
                ),
                sliver: SliverToBoxAdapter(
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1120),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _HeroCard(
                            onOpenOffer: () =>
                                _trigger(ShowcaseEvents.offerOpened),
                          ),
                          const SizedBox(height: 30),
                          _SectionHeading(
                            eyebrow: 'CURATED FOR MAYA',
                            title: 'Restock your favorites',
                            trailing: TextButton(
                              onPressed: () => _trigger(
                                ShowcaseEvents.weekendCollectionViewed,
                              ),
                              child: const Text('Browse collection'),
                            ),
                          ),
                          const SizedBox(height: 14),
                          _ProductGrid(
                            wide: wide,
                            onSave: (productId) => _trigger(
                              ShowcaseEvents.productSaved,
                              {'productId': productId},
                            ),
                            onAdd: _addFeaturedItem,
                          ),
                          const SizedBox(height: 30),
                          if (wide)
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: _DeliveryCard(
                                    onCheck: () => _trigger(
                                      ShowcaseEvents.deliveryChecked,
                                      const {'postalCode': '94107'},
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 18),
                                Expanded(
                                  flex: 4,
                                  child: _CampaignStudio(
                                    activity: _activity,
                                    onBundle: () => _trigger(
                                      ShowcaseEvents.weekendBundleAdded,
                                    ),
                                    onCheckout: () => _trigger(
                                      ShowcaseEvents.checkoutStarted,
                                    ),
                                    onCompleteOrder: () => _trigger(
                                      ShowcaseEvents.orderCompleted,
                                      const {'total': 74, 'currency': 'USD'},
                                    ),
                                    onReplayWelcome: () => _trigger(
                                      ShowcaseEvents.appOpened,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          else ...[
                            _DeliveryCard(
                              onCheck: () => _trigger(
                                ShowcaseEvents.deliveryChecked,
                                const {'postalCode': '94107'},
                              ),
                            ),
                            const SizedBox(height: 18),
                            _CampaignStudio(
                              activity: _activity,
                              onBundle: () => _trigger(
                                ShowcaseEvents.weekendBundleAdded,
                              ),
                              onCheckout: () =>
                                  _trigger(ShowcaseEvents.checkoutStarted),
                              onCompleteOrder: () => _trigger(
                                ShowcaseEvents.orderCompleted,
                                const {'total': 74, 'currency': 'USD'},
                              ),
                              onReplayWelcome: () =>
                                  _trigger(ShowcaseEvents.appOpened),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _BrandMark extends StatelessWidget {
  const _BrandMark();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34,
      height: 34,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Icon(Icons.north_east, color: Colors.white, size: 20),
    );
  }
}

class _HeroCard extends StatelessWidget {
  const _HeroCard({required this.onOpenOffer});

  final VoidCallback onOpenOffer;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: const LinearGradient(
          colors: [Color(0xFF37251E), Color(0xFF7C3F25)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 24,
        runSpacing: 24,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 590),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'MEMBER WEEKEND',
                  style: TextStyle(
                    color: Color(0xFFFFC99D),
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.4,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Good afternoon, Maya',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Thoughtful staples, quick delivery, and a new offer picked '
                  'for the way you shop.',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.white70,
                        height: 1.45,
                      ),
                ),
              ],
            ),
          ),
          FilledButton.icon(
            style: FilledButton.styleFrom(
              backgroundColor: const Color(0xFFFFD5B5),
              foregroundColor: const Color(0xFF4A291D),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            ),
            onPressed: onOpenOffer,
            icon: const Icon(Icons.local_offer_outlined),
            label: const Text('Open my offer'),
          ),
        ],
      ),
    );
  }
}

class _SectionHeading extends StatelessWidget {
  const _SectionHeading({
    required this.eyebrow,
    required this.title,
    required this.trailing,
  });

  final String eyebrow;
  final String title;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                eyebrow,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.1,
                    ),
              ),
              const SizedBox(height: 4),
              Text(title, style: Theme.of(context).textTheme.headlineSmall),
            ],
          ),
        ),
        trailing,
      ],
    );
  }
}

class _ProductGrid extends StatelessWidget {
  const _ProductGrid({
    required this.wide,
    required this.onSave,
    required this.onAdd,
  });

  final bool wide;
  final ValueChanged<String> onSave;
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    const products = [
      _Product(
        'olive-oil',
        'Citrus olive oil',
        'Bright + peppery',
        r'$18',
        Icons.water_drop,
      ),
      _Product(
        'granola',
        'Sunday granola',
        'Maple + sea salt',
        r'$12',
        Icons.grain,
      ),
      _Product(
        'coffee',
        'Cloud roast',
        'Chocolate + plum',
        r'$16',
        Icons.coffee_outlined,
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: wide ? 3 : 1,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        mainAxisExtent: 210,
      ),
      itemBuilder: (context, index) => _ProductCard(
        product: products[index],
        onSave: onSave,
        onAdd: onAdd,
      ),
    );
  }
}

class _Product {
  const _Product(this.id, this.name, this.detail, this.price, this.icon);

  final String id;
  final String name;
  final String detail;
  final String price;
  final IconData icon;
}

class _ProductCard extends StatelessWidget {
  const _ProductCard({
    required this.product,
    required this.onSave,
    required this.onAdd,
  });

  final _Product product;
  final ValueChanged<String> onSave;
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF3E3D4),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(product.icon, color: const Color(0xFF814225)),
                ),
                const Spacer(),
                IconButton(
                  tooltip: 'Save ${product.name}',
                  onPressed: () => onSave(product.id),
                  icon: const Icon(Icons.favorite_border),
                ),
              ],
            ),
            const Spacer(),
            Text(product.name, style: Theme.of(context).textTheme.titleMedium),
            Text(
              product.detail,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  product.price,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const Spacer(),
                FilledButton.tonalIcon(
                  onPressed: onAdd,
                  icon: const Icon(Icons.add, size: 18),
                  label: const Text('Add'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _DeliveryCard extends StatelessWidget {
  const _DeliveryCard({required this.onCheck});

  final VoidCallback onCheck;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.location_on_outlined, size: 30),
            const SizedBox(height: 16),
            Text('Same-day delivery',
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 6),
            Text(
              'Check today\'s windows for 94107.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
            const SizedBox(height: 20),
            OutlinedButton.icon(
              onPressed: onCheck,
              icon: const Icon(Icons.near_me_outlined),
              label: const Text('Check availability'),
            ),
          ],
        ),
      ),
    );
  }
}

class _CampaignStudio extends StatelessWidget {
  const _CampaignStudio({
    required this.activity,
    required this.onBundle,
    required this.onCheckout,
    required this.onCompleteOrder,
    required this.onReplayWelcome,
  });

  final String activity;
  final VoidCallback onBundle;
  final VoidCallback onCheckout;
  final VoidCallback onCompleteOrder;
  final VoidCallback onReplayWelcome;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFE9EFE7),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.campaign_outlined),
                const SizedBox(width: 10),
                Text('Campaign studio',
                    style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              'Exercise lifecycle moments without leaving the storefront.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 18),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ActionChip(
                  avatar: const Icon(Icons.inventory_2_outlined, size: 18),
                  label: const Text('Add viewed bundle'),
                  onPressed: onBundle,
                ),
                ActionChip(
                  avatar: const Icon(Icons.lock_outline, size: 18),
                  label: const Text('Start checkout'),
                  onPressed: onCheckout,
                ),
                ActionChip(
                  avatar: const Icon(Icons.receipt_long_outlined, size: 18),
                  label: const Text('Complete order'),
                  onPressed: onCompleteOrder,
                ),
                ActionChip(
                  avatar: const Icon(Icons.waving_hand_outlined, size: 18),
                  label: const Text('Replay welcome'),
                  onPressed: onReplayWelcome,
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 12),
            Text(
              'Condition coverage',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 8),
            const _ConditionRow(label: 'Welcome', rule: 'Once ever'),
            const _ConditionRow(
              label: 'Member offer',
              rule: 'Plus + English, max 2',
            ),
            const _ConditionRow(
              label: 'Add to cart',
              rule: r'Featured source + total >= $40',
            ),
            const _ConditionRow(
              label: 'Save item',
              rule: 'Different from last product ID',
            ),
            const _ConditionRow(
              label: 'Delivery',
              rule: 'Android + 94xxx ZIP',
            ),
            const _ConditionRow(
              label: 'Checkout',
              rule: 'Early access + app v1.0.0',
            ),
            const _ConditionRow(
              label: 'Order',
              rule: r'Gold/Platinum + total >= $50',
            ),
            const _ConditionRow(
              label: 'Bundle',
              rule: 'Sequence + current event guard',
            ),
            const SizedBox(height: 18),
            Text(
              activity,
              key: const ValueKey('campaign-activity'),
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: const Color(0xFF426146),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ConditionRow extends StatelessWidget {
  const _ConditionRow({required this.label, required this.rule});

  final String label;
  final String rule;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          SizedBox(
            width: 90,
            child: Text(
              label,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
          Expanded(
            child: Text(
              rule,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EagerInitialization extends ConsumerWidget {
  const _EagerInitialization({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(inAppMessagingProvider);
    return child;
  }
}
