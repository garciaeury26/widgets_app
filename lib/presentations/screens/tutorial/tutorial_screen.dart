import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTutorialScreen extends StatelessWidget {
  final String name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tutorial'),
      ),
      body: Container(),
    );
  }
}
