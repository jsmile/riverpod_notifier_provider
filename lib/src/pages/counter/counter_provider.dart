import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../utils/ansi_color_debug.dart';

part 'counter_provider.g.dart';

// /// state 에 대한 business logic 을 담당하는 클래스
// class CounterAutoFamNotifier extends AutoDisposeFamilyNotifier<int, int> {
//   // int publicValue = 0;          // Notifier 에 public variable 선언 불가
//   // int _publicValue = 0;         // Notifier 에 private variable 선언 가능

//   @override
//   int build(int arg) {
//     // param 은 arg 로 고정
//     debugPrint(info('### CounterAutoFamNotifier initialized ###'));

//     ref.onDispose(() {
//       debugPrint(info('### CounterAutoFamNotifier disposed ###'));
//     });

//     return arg;
//   }

//   void increase() {
//     state++;
//   }
// }

// // NotifierProvider.family<notifierT, stateT, argT>
// final counterAutoFamNotiProvider = NotifierProvider.autoDispose
//     .family<CounterAutoFamNotifier, int, int>(CounterAutoFamNotifier.new);
// // final counterAutoFamNotiProvider =
// //     NotifierProvider.autoDispose.family<CounterAutoFamNotifier, int, int>(() {
// //   return CounterAutoFamNotifier();
// // });

@riverpod
class CounterAutoFamNoti extends _$CounterAutoFamNoti {
  @override
  int build(int initialValue) {
    debugPrint(info('### CounterAutoFamNotiProvider initialized ###'));
    ref.onDispose(() {
      debugPrint(info('### CounterAutoFamNotiProvider disposed ###'));
    });
    return initialValue;
  }

  void increase() {
    state++;
  }
}
