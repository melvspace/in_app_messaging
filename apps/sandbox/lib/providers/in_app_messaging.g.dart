// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'in_app_messaging.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(inAppMessaging)
const inAppMessagingProvider = InAppMessagingProvider._();

final class InAppMessagingProvider
    extends $FunctionalProvider<InAppMessaging, InAppMessaging, InAppMessaging>
    with $Provider<InAppMessaging> {
  const InAppMessagingProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'inAppMessagingProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$inAppMessagingHash();

  @$internal
  @override
  $ProviderElement<InAppMessaging> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  InAppMessaging create(Ref ref) {
    return inAppMessaging(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(InAppMessaging value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<InAppMessaging>(value),
    );
  }
}

String _$inAppMessagingHash() => r'27a13c56ed3def13c59ec377ca887362a80bc044';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
