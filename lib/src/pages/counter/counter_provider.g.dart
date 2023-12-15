// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$counterAutoFamNotiHash() =>
    r'221497b12e4ea72300d825203eacf11933c647bc';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$CounterAutoFamNoti extends BuildlessAutoDisposeNotifier<int> {
  late final int initialValue;

  int build(
    int initialValue,
  );
}

/// See also [CounterAutoFamNoti].
@ProviderFor(CounterAutoFamNoti)
const counterAutoFamNotiProvider = CounterAutoFamNotiFamily();

/// See also [CounterAutoFamNoti].
class CounterAutoFamNotiFamily extends Family<int> {
  /// See also [CounterAutoFamNoti].
  const CounterAutoFamNotiFamily();

  /// See also [CounterAutoFamNoti].
  CounterAutoFamNotiProvider call(
    int initialValue,
  ) {
    return CounterAutoFamNotiProvider(
      initialValue,
    );
  }

  @override
  CounterAutoFamNotiProvider getProviderOverride(
    covariant CounterAutoFamNotiProvider provider,
  ) {
    return call(
      provider.initialValue,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'counterAutoFamNotiProvider';
}

/// See also [CounterAutoFamNoti].
class CounterAutoFamNotiProvider
    extends AutoDisposeNotifierProviderImpl<CounterAutoFamNoti, int> {
  /// See also [CounterAutoFamNoti].
  CounterAutoFamNotiProvider(
    int initialValue,
  ) : this._internal(
          () => CounterAutoFamNoti()..initialValue = initialValue,
          from: counterAutoFamNotiProvider,
          name: r'counterAutoFamNotiProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$counterAutoFamNotiHash,
          dependencies: CounterAutoFamNotiFamily._dependencies,
          allTransitiveDependencies:
              CounterAutoFamNotiFamily._allTransitiveDependencies,
          initialValue: initialValue,
        );

  CounterAutoFamNotiProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.initialValue,
  }) : super.internal();

  final int initialValue;

  @override
  int runNotifierBuild(
    covariant CounterAutoFamNoti notifier,
  ) {
    return notifier.build(
      initialValue,
    );
  }

  @override
  Override overrideWith(CounterAutoFamNoti Function() create) {
    return ProviderOverride(
      origin: this,
      override: CounterAutoFamNotiProvider._internal(
        () => create()..initialValue = initialValue,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        initialValue: initialValue,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<CounterAutoFamNoti, int> createElement() {
    return _CounterAutoFamNotiProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CounterAutoFamNotiProvider &&
        other.initialValue == initialValue;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, initialValue.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CounterAutoFamNotiRef on AutoDisposeNotifierProviderRef<int> {
  /// The parameter `initialValue` of this provider.
  int get initialValue;
}

class _CounterAutoFamNotiProviderElement
    extends AutoDisposeNotifierProviderElement<CounterAutoFamNoti, int>
    with CounterAutoFamNotiRef {
  _CounterAutoFamNotiProviderElement(super.provider);

  @override
  int get initialValue => (origin as CounterAutoFamNotiProvider).initialValue;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
