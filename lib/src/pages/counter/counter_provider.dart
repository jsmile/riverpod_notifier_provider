import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/ansi_color_debug.dart';

/// state 에 대한 business logic 을 담당하는 클래스
class CounterAutoFamNotifier extends AutoDisposeFamilyNotifier<int, int> {
  // int publicValue = 0;          // public variable 선언 불가
  // int _publicValue = 0;         // private variable 선언 가능

  @override
  int build(int arg) {
    // param 은 arg 로 고정
    debugPrint(info('### CounterAutoFamNotifier initialized ###'));

    ref.onDispose(() {
      debugPrint(info('### CounterAutoFamNotifier disposed ###'));
    });

    return arg;
  }

  void increase() {
    state++;
  }
}

// NotifierProvider.family<notifierT, stateT, argT>
final counterAutoFamNotiProvider = NotifierProvider.autoDispose
    .family<CounterAutoFamNotifier, int, int>(CounterAutoFamNotifier.new);
// final counterAutoFamNotiProvider =
//     NotifierProvider.autoDispose.family<CounterAutoFamNotifier, int, int>(() {
//   return CounterAutoFamNotifier();
// });
