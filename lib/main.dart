import 'package:flutter/material.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
import 'package:widgets_app/presentations/screens/buttons/buttons_screens.dart';
import 'package:widgets_app/presentations/screens/home/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      routes: {
        '/buttons': (context) => const ButtonScreen(),
        '/home':(context) => const HomeScreen()
      },
      theme:AppTheme(selectedColor: 6).getTheme(),
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: const HomeScreen()
    );
  }
}