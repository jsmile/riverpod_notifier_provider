import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_notifier_provider/src/pages/enum_async_activity/enum_async_activity_state.dart';
import 'package:riverpod_notifier_provider/src/providers/dio_provider.dart';

import '../../models/activity.dart';
import '../../utils/ansi_color_debug.dart';

part 'enum_async_activity_provider.g.dart';

@riverpod
class MyCounterNoti extends _$MyCounterNoti {
  @override
  int build() {
    debugPrint(info('### MyCounterNotifier initialized ###'));

    ref.onDispose(() {
      debugPrint(info('### MyCounterNotifier disposed ###'));
    });

    return 0;
  }

  void increment() {
    state++;
  }
}

/// NotifierProvider 가 invalidate 거나 watch() 하고 있는 provider 변하는 경우
///   Notifier 자신은 dispose 되고 다시 build() 되지만,
///   이미 만들어진 Notifier instance 는 dispose 되지는 않는다.
@riverpod
class EnumAsyncActivityNoti extends _$EnumAsyncActivityNoti {
  int _errorCount = 0;

  EnumAsyncActivityNoti() {
    debugPrint(info('### EnumAsyncActivityNotifier constructor called ###'));
  }

  @override
  EnumAsyncActivityState build() {
    debugPrint(info('### EnumAsyncActivityNotifier initialized ###'));

    ref.onDispose(() {
      debugPrint(info('### enumAsyncActivityNotifier disposed ###'));
    });

    ref.watch(myCounterNotiProvider);

    debugPrint(info('###  enumAsyncActivityNotifier hash : $hashCode ###'));
    // 조회를 위해 state 사전 초기화
    state = EnumAsyncActivityState.initial();
    // Notifier 생성 시에 조회 시작( UI initState() 에서 조회 불필요 )
    fetchActivity(activityTypes[0]);

    return EnumAsyncActivityState.initial(); // 시작과 함게 조회를 하므로 loading 상태로 시작
  }

  Future<void> fetchActivity(String activityType) async {
    debugPrint(success(
        '###  EnumAsyncActivityNotifier fetchActivity hash : $hashCode ###'));
    // 조히 이전에 state 는 초기화가 되어 있어야 함.
    state = state.copyWith(status: AsyncActivityStatus.loading);

    try {
      debugPrint(success(
          '### EnumAsyncActivityNotifier _errorCount : $_errorCount ###'));

      if ((_errorCount++ % 2) != 1) {
        await Future.delayed(const Duration(milliseconds: 500));
        throw 'Fail to fatch activity';
      }

      final response = await ref.read(dioProvider).get('?type=$activityType');
      final activity = Activity.fromJson(response.data);

      state = state.copyWith(
        status: AsyncActivityStatus.success,
        activity: activity,
      );
    } catch (e) {
      state = state.copyWith(
        status: AsyncActivityStatus.failure,
        error: e.toString(),
      );
    }
  }
}
