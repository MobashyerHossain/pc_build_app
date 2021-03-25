import 'package:flutter/material.dart';

class MyColorTheme {
  final lightBodyText = Colors.orange[100];
  final lightHeadline = Colors.orange[200];

  final darkBodyText = Colors.grey[850];
  final darkHeadline = Colors.grey[900];

  final lightButtonText = Colors.orange[200];
  final darkButtonText = Colors.grey[800];

  final lightButton = Colors.grey[200];
  final darkButton = Colors.orange[800];

  final lightPrimary = Colors.orange[200];
  final lightBackground = Colors.orange[300];

  final darkPrimary = Colors.grey[800];
  final darkBackground = Colors.grey[400];

  final lightAccentColor = Colors.orange[300];
  final darkAccentColor = Colors.grey[700];

  static const lightTileBackground = MyColorTheme.light;
  static const darkTileBackground = MyColorTheme.dark;
  static const light = Colors.lightGreenAccent;
  static const dark = Colors.deepPurple;

  static const lightColorScheme = ColorScheme(
    primary: MyColorTheme.dark,
    primaryVariant: MyColorTheme.dark,
    secondary: MyColorTheme.dark,
    secondaryVariant: MyColorTheme.dark,
    surface: MyColorTheme.dark,
    background: MyColorTheme.light,
    error: Colors.red,
    onPrimary: MyColorTheme.light,
    onSecondary: MyColorTheme.light,
    onSurface: MyColorTheme.light,
    onBackground: MyColorTheme.light,
    onError: Colors.red,
    brightness: Brightness.light,
  );

  static const darkColorScheme = ColorScheme(
    primary: MyColorTheme.light,
    primaryVariant: MyColorTheme.light,
    secondary: MyColorTheme.light,
    secondaryVariant: MyColorTheme.light,
    surface: MyColorTheme.light,
    background: MyColorTheme.dark,
    error: Colors.red,
    onPrimary: MyColorTheme.dark,
    onSecondary: MyColorTheme.dark,
    onSurface: MyColorTheme.dark,
    onBackground: MyColorTheme.dark,
    onError: Colors.red,
    brightness: Brightness.dark,
  );
}
