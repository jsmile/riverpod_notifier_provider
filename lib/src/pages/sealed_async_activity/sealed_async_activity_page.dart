import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_notifier_provider/src/pages/enum_activity/activity_widget.dart';

import 'sealed_async_activity_state.dart';

import '../../models/activity.dart';
import 'sealed_async_activity_provider.dart';

class SealedAsyncActivityPage extends ConsumerStatefulWidget {
  const SealedAsyncActivityPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SealedActvityPageState();
}

class _SealedActvityPageState extends ConsumerState<SealedAsyncActivityPage> {
  Widget? prevWidget;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      ref
          .read(sealedAsyncActivityNotiProvider.notifier)
          .fetchActivity(activityTypes[0]);
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<SealedAsyncActivityState>(sealedAsyncActivityNotiProvider,
        (previous, next) {
      switch (next) {
        case SealedAsyncActivityFailure(error: String error):
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

    final sealedAsyncActivityState = ref.watch(sealedAsyncActivityNotiProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('SealedAsyncActivityNotifie'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.invalidate(sealedAsyncActivityNotiProvider);
            },
          ),
        ],
      ),
      body: switch (sealedAsyncActivityState) {
        SealedAsyncActivityInitial() => Center(
            child: Text(
              'Get Some Activity',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
        SealedAsyncActivityLoading() => const Center(
            child: CircularProgressIndicator(),
          ),
        SealedAsyncActivitySuccess(activity: Activity activity) => prevWidget =
              Center(
            child: ActivityWidget(activity: activity),
          ),
        SealedAsyncActivityFailure() => prevWidget == null
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
              .read(sealedAsyncActivityNotiProvider.notifier)
              .fetchActivity(activityTypes[randomNumber]);
        },
      ),
    );
  }
}
