import 'package:flutter/material.dart';

class ComponentPage extends StatefulWidget {
  const ComponentPage({super.key});

  @override
  State<ComponentPage> createState() => _ComponentPageState();
}

class _ComponentPageState extends State<ComponentPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('ComponentPage'),
      ),
    );
  }
}
