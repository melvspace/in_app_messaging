// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(iamMessages)
const iamMessagesProvider = IamMessagesProvider._();

final class IamMessagesProvider
    extends $FunctionalProvider<List<Message>, List<Message>, List<Message>>
    with $Provider<List<Message>> {
  const IamMessagesProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'iamMessagesProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$iamMessagesHash();

  @$internal
  @override
  $ProviderElement<List<Message>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<Message> create(Ref ref) {
    return iamMessages(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Message> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Message>>(value),
    );
  }
}

String _$iamMessagesHash() => r'44602e29c4baea11a8dfd8ddc9b543847dcc3ad7';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
