import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:orange_ui_kit/orange_juice.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  late final log = Logger(runtimeType.toString());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            OgButton(
              child: Icon(Icons.access_time_rounded),
              onPressed: () {
                log.info('object');
              },
            ),
            CupertinoButton(
              onPressed: () {},
              child: Icon(Icons.access_time_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
