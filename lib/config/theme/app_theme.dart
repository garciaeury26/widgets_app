import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange,
  Colors.pink,
  Colors.pinkAccent
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0, 'Selected colors must be greated 0'),
        assert(selectedColor < colorList.length,'Selected colors must be greated 0');

  ThemeData getTheme() =>
      ThemeData(useMaterial3: true, brightness: Brightness.dark,colorSchemeSeed: colorList[selectedColor],appBarTheme: const AppBarTheme(centerTitle: true));
}
