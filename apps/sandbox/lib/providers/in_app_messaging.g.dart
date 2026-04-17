// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'in_app_messaging.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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

String _$inAppMessagingHash() => r'5314814c84a584953e0b1c8a6d838fc9a4379228';
