import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/activity.dart';
import '../../providers/dio_provider.dart';
import '../../utils/ansi_color_debug.dart';
import 'sealed_async_activity_state.dart';

part 'sealed_async_activity_provider.g.dart';

@riverpod
class SealedAsyncActivityNoti extends _$SealedAsyncActivityNoti {
  int _errorCount = 0;

  @override
  SealedAsyncActivityState build() {
    ref.onDispose(() {
      debugPrint(info('### SealedAsyncActivityNotifier disposed ###'));
    });

    debugPrint(info('###  SealedAsyncActivityNotifier hash : $hashCode ###'));
    debugPrint(info('### SealedAsyncActivityNotifier initialized ###'));
    fetchActivity(activityTypes[0]);

    return SealedAsyncActivityInitial();
  }

  Future<void> fetchActivity(String activityType) async {
    debugPrint(success(
        '###  SealedAsyncActivityNotifier fetchActivity hash : $hashCode ###'));
    state = SealedAsyncActivityLoading();

    try {
      debugPrint(success(
          '### SealedAsyncActivityNotifier _errorCount : $_errorCount ###'));

      if ((_errorCount++ % 2) != 1) {
        await Future.delayed(const Duration(milliseconds: 500));
        throw 'Fail to fatch activity';
      }

      final response = await ref.read(dioProvider).get('?type=$activityType');
      final activity = Activity.fromJson(response.data);

      state = SealedAsyncActivitySuccess(activity: activity);
    } catch (e) {
      state = SealedAsyncActivityFailure(error: e.toString());
    }
  }
}
