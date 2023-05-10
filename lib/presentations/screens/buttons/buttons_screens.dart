import 'package:flutter/material.dart';

class ButtonScreen extends StatelessWidget {

  // para acceder a las rutas por nombro => opcional
  static const routerName = 'home_screen';

  const ButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons screen'),
      ),
      body: const Placeholder(),
    );
  }
}
