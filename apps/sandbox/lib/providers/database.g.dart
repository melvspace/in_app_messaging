// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(database)
const databaseProvider = DatabaseProvider._();

final class DatabaseProvider extends $FunctionalProvider<
    InAppMessagingDatabase,
    InAppMessagingDatabase,
    InAppMessagingDatabase> with $Provider<InAppMessagingDatabase> {
  const DatabaseProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'databaseProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$databaseHash();

  @$internal
  @override
  $ProviderElement<InAppMessagingDatabase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  InAppMessagingDatabase create(Ref ref) {
    return database(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(InAppMessagingDatabase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<InAppMessagingDatabase>(value),
    );
  }
}

String _$databaseHash() => r'831f6082987160e574be131e11b20f1b965fab7e';
