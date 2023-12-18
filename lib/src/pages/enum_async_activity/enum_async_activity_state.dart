import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_notifier_provider/src/models/activity.dart';

part 'enum_async_activity_state.freezed.dart';

enum AsyncActivityStatus {
  initial, // 진입하자 마자 바로 조회를 하므로 사용하지 않음
  loading,
  success,
  failure,
}

@freezed
class EnumAsyncActivityState with _$EnumAsyncActivityState {
  const factory EnumAsyncActivityState(
      {required AsyncActivityStatus status,
      required Activity activity,
      required String error}) = _EnumAsyncActivityState;

  factory EnumAsyncActivityState.initial() => EnumAsyncActivityState(
        status: AsyncActivityStatus.loading, // 시작과 동시에 조회로 인해 loading 상태로 시작
        activity: Activity.empty(),
        error: '',
      );
}
