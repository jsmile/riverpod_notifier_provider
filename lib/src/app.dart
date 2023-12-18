import 'package:flutter/material.dart';
import 'package:riverpod_notifier_provider/src/pages/enum_activity/enum_activity_page.dart';
import 'package:riverpod_notifier_provider/src/pages/enum_async_activity/enum_async_activity_page.dart';
import 'package:riverpod_notifier_provider/src/pages/sealed_activity/sealed_activity_page.dart';

import 'pages/counter/counter_page.dart';
import 'pages/sealed_async_activity/sealed_async_activity_page.dart';
import 'widgets/custom_button.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NotifierProvider',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NotifierProvider'),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(20),
          shrinkWrap: true,
          children: const [
            CustomButton(
              title: 'Counter',
              child: CounterPage(),
            ),
            CustomButton(
              title: 'Enum State Activity',
              child: EnumActivityPage(),
            ),
            CustomButton(
              title: 'Sealed State Activity',
              child: SealedActivityPage(),
            ),
            CustomButton(
              title: 'Enum State Async Activity',
              child: EnumAsyncActivityPage(),
            ),
            CustomButton(
              title: 'Sealed State Async Activity',
              child: SealedAsyncActivityPage(),
            ),
          ],
        ),
      ),
    );
  }
}
