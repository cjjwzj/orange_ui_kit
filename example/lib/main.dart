import 'package:example/routes/router.dart';
import 'package:example/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:orange_ui_kit/orange_juice.dart';

void main() {
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    // ignore: avoid_print
    print(
      '${record.level.name}:${record.time}:${record.loggerName}-${record.message}',
    );
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: orangeThemeData,
      routerConfig: router,
    );
  }
}
