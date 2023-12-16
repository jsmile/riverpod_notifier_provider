import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_notifier_provider/src/pages/enum_activity/enum_activity_state.dart';
import 'package:riverpod_notifier_provider/src/providers/dio_provider.dart';

import '../../models/activity.dart';
import '../../utils/ansi_color_debug.dart';

part 'enum_activity_provider.g.dart';

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
class EnumActivityNoti extends _$EnumActivityNoti {
  int _errorCount = 0;

  @override
  EnumActivityState build() {
    debugPrint(info('###  EnumActivityNotifier hash : $hashCode ###'));

    debugPrint(info('### EnumActivityNotifier initialized ###'));

    ref.onDispose(() {
      debugPrint(info('### EnumActivityNotifier disposed ###'));
    });

    ref.watch(myCounterNotiProvider);

    return EnumActivityState.initial();
  }

  Future<void> fetchActivity(String activityType) async {
    debugPrint(success(
        '###  EnumActivityNotifier fetchActivity hash : $hashCode ###'));
    state = state.copyWith(status: ActivityStatus.loading);

    try {
      debugPrint(
          success('### EnumActivityNotifier _errorCount : $_errorCount ###'));

      if ((_errorCount++ % 2) != 1) {
        await Future.delayed(const Duration(milliseconds: 500));
        throw 'Fail to fatch activity';
      }

      final response = await ref.read(dioProvider).get('?type=$activityType');
      final activity = Activity.fromJson(response.data);

      state = state.copyWith(
        status: ActivityStatus.success,
        activity: activity,
      );
    } catch (e) {
      state = state.copyWith(
        status: ActivityStatus.failure,
        error: e.toString(),
      );
    }
  }
}
