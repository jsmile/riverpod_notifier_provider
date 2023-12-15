import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/ansi_color_debug.dart';

/// state 에 대한 business logic 을 담당하는 클래스
class CounterFamNotifier extends FamilyNotifier<int, int> {
  @override
  int build(int arg) {
    // param 은 arg 로 고정
    debugPrint(info('### CounterFamNotifier initialized ###'));

    ref.onDispose(() {
      debugPrint(info('### CounterFamNotifier disposed ###'));
    });

    return arg;
  }

  void increase() {
    state++;
  }
}

// NotifierProvider.family<notifierT, stateT, argT>
final counterFamNotiProvider =
    NotifierProvider.family<CounterFamNotifier, int, int>(
        CounterFamNotifier.new);
// final counterFamNotiProvider = NotifierProvider.family<CounterFamNotifier, int, int>(() {
//   return CounterFamNotifier();
// });
