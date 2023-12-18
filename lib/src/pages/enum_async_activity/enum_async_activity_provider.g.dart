// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enum_async_activity_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$myCounterNotiHash() => r'96f8dc8a9b3d544e8c99315533eaf2b2d5aa8a69';

/// See also [MyCounterNoti].
@ProviderFor(MyCounterNoti)
final myCounterNotiProvider =
    AutoDisposeNotifierProvider<MyCounterNoti, int>.internal(
  MyCounterNoti.new,
  name: r'myCounterNotiProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$myCounterNotiHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MyCounterNoti = AutoDisposeNotifier<int>;
String _$enumAsyncActivityNotiHash() =>
    r'a3e0576f66aede1a3806edb0ec0109e6b9217141';

/// NotifierProvider 가 invalidate 거나 watch() 하고 있는 provider 변하는 경우
///   Notifier 자신은 dispose 되고 다시 build() 되지만,
///   이미 만들어진 Notifier instance 는 dispose 되지는 않는다.
///
/// Copied from [EnumAsyncActivityNoti].
@ProviderFor(EnumAsyncActivityNoti)
final enumAsyncActivityNotiProvider = AutoDisposeNotifierProvider<
    EnumAsyncActivityNoti, EnumAsyncActivityState>.internal(
  EnumAsyncActivityNoti.new,
  name: r'enumAsyncActivityNotiProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$enumAsyncActivityNotiHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$EnumAsyncActivityNoti = AutoDisposeNotifier<EnumAsyncActivityState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
