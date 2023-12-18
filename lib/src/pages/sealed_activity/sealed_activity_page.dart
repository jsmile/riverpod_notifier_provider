import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_notifier_provider/src/pages/enum_activity/activity_widget.dart';
import 'package:riverpod_notifier_provider/src/pages/sealed_activity/sealed_activity_state.dart';

import '../../models/activity.dart';
import 'sealed_activity_provider.dart';

class SealedActivityPage extends ConsumerStatefulWidget {
  const SealedActivityPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SealedActvityPageState();
}

class _SealedActvityPageState extends ConsumerState<SealedActivityPage> {
  Widget? prevWidget;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      ref
          .read(sealedActivityNotiProvider.notifier)
          .fetchActivity(activityTypes[0]);
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<SealedActivityState>(sealedActivityNotiProvider,
        (previous, next) {
      switch (next) {
        case SealedActivityFailure(error: String error):
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(
                  'Error',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                content: Text(
                  error,
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: Colors.red,
                  ),
                ),
              );
            },
          );
        case _:
      }
    });

    final sealedActivityState = ref.watch(sealedActivityNotiProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('SealedActivityNotifie'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.invalidate(sealedActivityNotiProvider);
            },
          ),
        ],
      ),
      body: switch (sealedActivityState) {
        SealedActivityInitial() => Center(
            child: Text(
              'Get Some Activity',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
        SealedActivityLoading() => const Center(
            child: CircularProgressIndicator(),
          ),
        SealedActivitySuccess(activity: Activity activity) => prevWidget =
              Center(
            child: ActivityWidget(activity: activity),
          ),
        SealedActivityFailure() => prevWidget == null
            ? Center(
                child: Text(
                  'Get Some Activity',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              )
            : prevWidget!,
      },
      floatingActionButton: FloatingActionButton.extended(
        label: Text('New Activity',
            style: Theme.of(context).textTheme.titleMedium),
        onPressed: () {
          final randomNumber = Random().nextInt(activityTypes.length);
          ref
              .read(sealedActivityNotiProvider.notifier)
              .fetchActivity(activityTypes[randomNumber]);
        },
      ),
    );
  }
}
