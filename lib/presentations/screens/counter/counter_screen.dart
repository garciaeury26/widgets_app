import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentations/screens/providers/counter_provider.dart';
import 'package:widgets_app/presentations/screens/providers/theme_provider.dart';

class CouterSCreen extends ConsumerWidget {
  const CouterSCreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    // estar pendiente del counterProvider
    //! nunca usar el (watch) en metodos
    final int counter = ref.watch(counterProvider);

    final isDarkMode = ref.watch(darkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
        actions: [
          IconButton(
              onPressed: () {
                ref.read(darkModeProvider.notifier).update((state) => !state);
              },
              icon: Icon(isDarkMode
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined))
        ],
      ),
      body: Center(
          child: Text(
        '$counter',
        style: const TextStyle(fontSize: 30),
      )),
      floatingActionButton: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                ref.read(counterProvider.notifier).state++;
              },
              child: const Icon(Icons.add),
            ),
            const SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              onPressed: () {
                ref.read(counterProvider.notifier).state = 0;
              },
              child: const Icon(Icons.restore),
            )
          ],
        ),
      ),
    );
  }
}
