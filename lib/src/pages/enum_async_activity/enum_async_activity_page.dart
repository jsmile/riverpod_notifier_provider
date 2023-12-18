import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_notifier_provider/src/models/activity.dart';

import '../../utils/ansi_color_debug.dart';
import 'enum_async_activity_provider.dart';
import '../enum_activity/activity_widget.dart';
import 'enum_async_activity_state.dart';

/// Notifier 의 build() 에서 조회를 하므로 initState() 가 필요없으므로
/// StatefulConsumerWidget --> ConsumerWidget 변환
class EnumAsyncActivityPage extends ConsumerWidget {
  const EnumAsyncActivityPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(enumAsyncActivityNotiProvider, (previous, next) {
      if (next.status == AsyncActivityStatus.failure) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(next.error),
            );
          },
        );
      }
    });
    final activityState = ref.watch(enumAsyncActivityNotiProvider);
    debugPrint(success('### enumAsyncActivityState : UI ###'));
    debugPrint(success('### enumAsyncActivityState : $activityState ###'));

    return Scaffold(
      appBar: AppBar(
        title: const Text('EnumAsyncActivityNotifierProvider'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              ref.read(myCounterNotiProvider.notifier).increment();
            },
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.invalidate(enumAsyncActivityNotiProvider);
            },
          ),
        ],
      ),
      body: switch (activityState.status) {
        AsyncActivityStatus.initial => const Center(
            child: Text(
              'Get Some Activity',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        AsyncActivityStatus.loading => const Center(
            child: CircularProgressIndicator(),
          ),
        AsyncActivityStatus.failure =>
          activityState.activity == Activity.empty()
              ? const Center(
                  child: Text(
                    'Get Some Activity',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.red,
                    ),
                  ),
                )
              : ActivityWidget(activity: activityState.activity),
        AsyncActivityStatus.success =>
          ActivityWidget(activity: activityState.activity),
      },
      floatingActionButton: FloatingActionButton.extended(
        label: Text('New Activity',
            style: Theme.of(context).textTheme.titleMedium),
        onPressed: () {
          final randomNumber = Random().nextInt(activityTypes.length);
          ref
              .read(enumAsyncActivityNotiProvider.notifier)
              .fetchActivity(activityTypes[randomNumber]);
        },
      ),
    );
  }
}
