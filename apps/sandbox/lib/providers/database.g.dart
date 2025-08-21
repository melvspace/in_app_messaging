// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

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

String _$databaseHash() => r'f03f4788ce85997daa3b46fe95111dd679099a34';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
