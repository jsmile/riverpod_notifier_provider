import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/ansi_color_debug.dart';

/// state 에 대한 business logic 을 담당하는 클래스
class CounterAutoNotifier extends AutoDisposeNotifier<int> {
  @override
  int build() {
    debugPrint(info('### CounterAutoNotifier initialized ###'));

    ref.onDispose(() {
      debugPrint(info('### CounterAutoNotifier disposed ###'));
    });

    return 0;
  }

  void increase() {
    state++;
  }
}

// NotifierProvider<notifierT, stateT>
final counterAutoNotiProvider =
    NotifierProvider.autoDispose<CounterAutoNotifier, int>(
        CounterAutoNotifier.new);
// final counterAutoNotiProvider = NotifierProvider.autoDispose<AutoDisposeNotifier, int>(() {
//   return CounterAutoNotifier();
// });
