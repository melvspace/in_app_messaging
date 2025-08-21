// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigator.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(navigator)
const navigatorProvider = NavigatorProvider._();

final class NavigatorProvider extends $FunctionalProvider<
    GlobalKey<NavigatorState>,
    GlobalKey<NavigatorState>,
    GlobalKey<NavigatorState>> with $Provider<GlobalKey<NavigatorState>> {
  const NavigatorProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'navigatorProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$navigatorHash();

  @$internal
  @override
  $ProviderElement<GlobalKey<NavigatorState>> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GlobalKey<NavigatorState> create(Ref ref) {
    return navigator(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GlobalKey<NavigatorState> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GlobalKey<NavigatorState>>(value),
    );
  }
}

String _$navigatorHash() => r'088ba84932aaf4c8652061faf9ef1e0190171287';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
