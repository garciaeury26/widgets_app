import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/theme_provider.dart';

class ThemeScreen extends ConsumerWidget {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final isDarkMode = ref.watch(darkModeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Config'),
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
      body: const _ThemeChargerView(),
    );
  }
}

class _ThemeChargerView extends ConsumerWidget {
  const _ThemeChargerView();

  @override
  Widget build(BuildContext context, ref) {
    final List<Color> colors = ref.watch(colorListProvider);
    final int colorSeledted = ref.watch(selectedColorProvider);

    return ListView.builder(
        itemCount: colors.length,
        itemBuilder: (context, index) {
          final color = colors[index];
          return RadioListTile(
              title: Text(
                'Color',
                style: TextStyle(color: color),
              ),
              activeColor: color,
              value: index,
              groupValue: colorSeledted,
              onChanged: (value) {
                ref.read(selectedColorProvider.notifier).state = value!;
              });
        });
  }
}
