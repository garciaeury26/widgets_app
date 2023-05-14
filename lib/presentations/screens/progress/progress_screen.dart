import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgresSCreen extends StatelessWidget {
  final String name = 'pogress_screen';

  const ProgresSCreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pogress Indicator')),
      body: _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: const [
        SizedBox(height: 30),
        Text('Circular Pogress Indicator'),
        SizedBox(height: 10),
        CircularProgressIndicator(
          strokeWidth: 4.0,
          backgroundColor: Colors.grey,
        ),
        SizedBox(height: 30),
        Text('Pogress Indicator Controlado'),
        SizedBox(height: 10),
        _ControlledPogressIndicator()
      ]),
    );
  }
}

class _ControlledPogressIndicator extends StatelessWidget {
  const _ControlledPogressIndicator();

  @override
  Widget build(BuildContext context) {
    // Se actualiza automáticamente cuando se producen nuevos datos en el flujo.
    return StreamBuilder(
        stream: Stream.periodic(const Duration(milliseconds: 300), (value) {
          return value * 2 / 100; // 0.0 to 1.0
        }).takeWhile((value) => value < 100),// se ejecutara hasta
        builder: (context,snapshot) {
          final progressValue = snapshot.data ?? 0;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                CircularProgressIndicator(
                  value: progressValue,
                  strokeWidth: 2,
                  backgroundColor: Colors.grey,
                ),
                const SizedBox(
                  height: 10,
                  width: 10,
                ),
                // para que el lineProgress => funine tiene que saver el ancho que va ocupar
                SizedBox(
                    width: 100,
                    child: LinearProgressIndicator(
                      value: progressValue,
                    ))
              ],
            ),
          );
        });
  }
}
