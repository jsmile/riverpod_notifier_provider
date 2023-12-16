import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_notifier_provider/src/models/activity.dart';
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
    final activityState = ref.watch(enumActivityNotiProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('EnumActivityNotifierProvider'),
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
        ActivityStatus.failure => Center(
            child: Text(
              activityState.error,
              style: const TextStyle(
                fontSize: 20.0,
                color: Colors.red,
              ),
            ),
          ),
        ActivityStatus.success =>
          ActivityWidget(activity: activityState.activity),
      },
      floatingActionButton: FloatingActionButton(
        child:
            Text('New Activity', style: Theme.of(context).textTheme.titleLarge),
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
