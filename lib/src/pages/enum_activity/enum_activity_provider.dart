import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_notifier_provider/src/pages/enum_activity/enum_activity_state.dart';
import 'package:riverpod_notifier_provider/src/providers/dio_provider.dart';

import '../../models/activity.dart';
import '../../utils/ansi_color_debug.dart';

part 'enum_activity_provider.g.dart';

@riverpod
class EnumActivityNoti extends _$EnumActivityNoti {
  @override
  EnumActivityState build() {
    debugPrint(info('### EnumActivityNotiProvider initialized ###'));

    ref.onDispose(() {
      debugPrint(info('### EnumActivityNotiProvider disposed ###'));
    });

    return EnumActivityState.initial();
  }

  Future<void> fetchActivity(String activityType) async {
    state = state.copyWith(status: ActivityStatus.loading);

    try {
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
