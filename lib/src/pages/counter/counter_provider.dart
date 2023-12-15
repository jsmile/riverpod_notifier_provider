import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/ansi_color_debug.dart';

/// state 에 대한 business logic 을 담당하는 클래스
class CounterNotifier extends Notifier<int> {
  @override
  int build() {
    debugPrint(info('### CounterNotifier initialized ###'));

    ref.onDispose(() {
      debugPrint(info('### CounterNotifier disposed ###'));
    });

    return 0;
  }

  void increase() {
    state++;
  }
}

// NotifierProvider<notifierT, stateT>
final counterNotiProvider =
    NotifierProvider<CounterNotifier, int>(CounterNotifier.new);
// final counterNotiProvider = NotifierProvider<CounterNotifier, int>(() {
//   return CounterNotifier();
// });
