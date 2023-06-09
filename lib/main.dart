import 'package:flutter/material.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
// import 'package:widgets_app/presentations/screens/screens.dart';

import 'config/router/router_config.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp.router(
      // routes: {
      //   '/buttons': (context) => const ButtonScreen(),
      //   '/home':(context) => const HomeScreen()
      // },
      // * manera recomendada de router
      routerConfig: appRouter,
      theme:AppTheme(selectedColor: 6).getTheme(),
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      // home: const HomeScreen()
    );
  }
}