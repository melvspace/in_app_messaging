// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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

String _$iamMessagesHash() => r'c0900a63b704744c2cc4f1c0b0756920a52a3c3e';
