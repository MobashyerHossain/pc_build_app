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

  final lightColorScheme = ColorScheme.light(
    primary: Colors.grey,
    primaryVariant: Colors.grey,
    secondary: Colors.grey,
    secondaryVariant: Colors.grey,
    surface: Colors.grey,
    background: Colors.orange,
    error: Colors.red,
    onPrimary: Colors.orange,
    onSecondary: Colors.orange,
    onSurface: Colors.orange,
    onBackground: Colors.orange,
    onError: Colors.red,
    brightness: Brightness.light,
  );

  final darkColorScheme = ColorScheme.dark(
    primary: Colors.orange,
    primaryVariant: Colors.orange,
    secondary: Colors.orange,
    secondaryVariant: Colors.orange,
    surface: Colors.orange,
    background: Colors.grey,
    error: Colors.red,
    onPrimary: Colors.grey,
    onSecondary: Colors.grey,
    onSurface: Colors.grey,
    onBackground: Colors.grey,
    onError: Colors.red,
    brightness: Brightness.dark,
  );
}
