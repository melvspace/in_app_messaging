// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigator.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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

String _$navigatorHash() => r'9cdacaf680df998d23ffa136e7358ef2b8d3a4b4';
