import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/activity.dart';
import '../../providers/dio_provider.dart';
import '../../utils/ansi_color_debug.dart';
import 'sealed_activity_state.dart';

part 'sealed_activity_provider.g.dart';

@riverpod
class SealedActivityNoti extends _$SealedActivityNoti {
  int _errorCount = 0;

  @override
  SealedActivityState build() {
    ref.onDispose(() {
      debugPrint(info('### SealedActivityNotifier disposed ###'));
    });

    debugPrint(info('###  SealedActivityNotifier hash : $hashCode ###'));
    debugPrint(info('### SealedActivityNotifier initialized ###'));

    return SealedActivityInitial();
  }

  Future<void> fetchActivity(String activityType) async {
    debugPrint(success(
        '###  SealedActivityNotifier fetchActivity hash : $hashCode ###'));
    state = SealedActivityLoading();

    try {
      debugPrint(
          success('### SealedActivityNotifier _errorCount : $_errorCount ###'));

      if ((_errorCount++ % 2) != 1) {
        await Future.delayed(const Duration(milliseconds: 500));
        throw 'Fail to fatch activity';
      }

      final response = await ref.read(dioProvider).get('?type=$activityType');
      final activity = Activity.fromJson(response.data);

      state = SealedActivitySuccess(activity: activity);
    } catch (e) {
      state = SealedActivityFailure(error: e.toString());
    }
  }
}
