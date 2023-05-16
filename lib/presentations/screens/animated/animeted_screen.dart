import 'package:flutter/material.dart';
import 'dart:math' show Random;

class AnimatedScreen extends StatefulWidget {
  final String name = 'animated_screen';

  const AnimatedScreen({super.key});

  @override
  _AnimatedScreenState createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 50;
  double height = 50;
  Color color = Colors.orange;
  double borderRadius = 10.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla animada'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 1000),
          curve: Curves.elasticInOut,
          width: width <= 0 ? 0 : width,
          height: height <= 0 ? 0 : height,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(borderRadius)),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _cambiarForma,
        child: const Icon(Icons.play_arrow_rounded),
      ),
    );
  }

  void _cambiarForma() {
    final random = Random();
    setState(() {
      width = random.nextInt(300) + 120;
      height = random.nextInt(200) + 120;
      borderRadius = random.nextInt(10) * 2 / 0.10;
      color = Color.fromRGBO(
          width.toInt(), height.toInt(), random.nextInt(1000), borderRadius);
    });
  }
}
