import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
import 'package:widgets_app/presentations/screens/providers/theme_provider.dart';
// import 'package:widgets_app/presentations/screens/screens.dart';

import 'config/router/router_config.dart';

void main() => runApp(
    // para que riverpod tenga asseso a todos los providers
    const ProviderScope(child: MyApp()));

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    // final bool isDarkMode = ref.watch(darkModeProvider);
    // final int selectedColor = ref.watch(selectedColorProvider);
    final appTheme = ref.watch(themeNotifierProvider);

    return MaterialApp.router(
      // routes: {
      //   '/buttons': (context) => const ButtonScreen(),
      //   '/home':(context) => const HomeScreen()
      // },
      // * manera recomendada de router
      routerConfig: appRouter,
      theme: appTheme.getTheme(),
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      // home: const HomeScreen()
    );
  }
}
