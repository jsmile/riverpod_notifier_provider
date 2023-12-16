import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_notifier_provider/src/models/activity.dart';
import 'package:riverpod_notifier_provider/src/pages/counter/counter_provider.dart';
import 'package:riverpod_notifier_provider/src/pages/enum_activity/enum_activity_provider.dart';

import 'activity_widget.dart';
import 'enum_activity_state.dart';

class EnumActivityPage extends ConsumerStatefulWidget {
  const EnumActivityPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EnumActivityPageState();
}

class _EnumActivityPageState extends ConsumerState<EnumActivityPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () {
        ref
            .read(enumActivityNotiProvider.notifier)
            .fetchActivity(activityTypes[0]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(enumActivityNotiProvider, (previous, next) {
      if (next.status == ActivityStatus.failure) {
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
    final activityState = ref.watch(enumActivityNotiProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('EnumActivityNotifierProvider'),
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
              ref.invalidate(enumActivityNotiProvider);
            },
          ),
        ],
      ),
      body: switch (activityState.status) {
        ActivityStatus.initial => const Center(
            child: Text(
              'Get Some Activity',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ActivityStatus.loading => const Center(
            child: CircularProgressIndicator(),
          ),
        ActivityStatus.failure => activityState.activity == Activity.empty()
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
        ActivityStatus.success =>
          ActivityWidget(activity: activityState.activity),
      },
      floatingActionButton: FloatingActionButton.extended(
        label: Text('New Activity',
            style: Theme.of(context).textTheme.titleMedium),
        onPressed: () {
          final randomNumber = Random().nextInt(activityTypes.length);
          ref
              .read(enumActivityNotiProvider.notifier)
              .fetchActivity(activityTypes[randomNumber]);
        },
      ),
    );
  }
}
