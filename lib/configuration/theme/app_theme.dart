import 'package:flutter/material.dart';

const Color _customColor = Color.fromARGB(255, 211, 210, 212);

const List<Color> _colorThemes = [
  _customColor,
  Colors.blueGrey,
  Colors.blue,
  Colors.orange,
  Colors.grey,
  Colors.yellow,
  Colors.pink,
];

class AppTheme {
  final int selectedColor;

  AppTheme({required this.selectedColor})
    : assert(
        selectedColor >= 0 && selectedColor <= _colorThemes.length -1,
        'Colors must be between ${_colorThemes.length}',
      );

  ThemeData theme() {
    return ThemeData(useMaterial3: true, colorSchemeSeed: _colorThemes[selectedColor]);
  }
}
