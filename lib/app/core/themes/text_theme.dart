import 'package:flutter/material.dart';
import 'package:pc_build_app/app/core/themes/color_theme.dart';

class MyTextTheme {
  final lightText = TextTheme(
    bodyText1: TextStyle(
      color: MyColorTheme().lightBodyText,
    ),
    bodyText2: TextStyle(
      color: MyColorTheme().lightBodyText,
    ),
    headline1: TextStyle(
      color: MyColorTheme().lightHeadline,
    ),
    headline2: TextStyle(
      color: MyColorTheme().lightHeadline,
    ),
    headline3: TextStyle(
      color: MyColorTheme().lightHeadline,
    ),
    headline4: TextStyle(
      color: MyColorTheme().lightHeadline,
    ),
    headline5: TextStyle(
      color: MyColorTheme().lightHeadline,
    ),
    headline6: TextStyle(
      color: MyColorTheme().lightHeadline,
    ),
    button: TextStyle(
      color: MyColorTheme().lightButtonText,
    ),
    overline: TextStyle(
      color: MyColorTheme().lightBodyText,
    ),
  );

  final darkText = TextTheme(
    bodyText1: TextStyle(
      color: MyColorTheme().darkBodyText,
    ),
    bodyText2: TextStyle(
      color: MyColorTheme().darkBodyText,
    ),
    headline1: TextStyle(
      color: MyColorTheme().darkHeadline,
    ),
    headline2: TextStyle(
      color: MyColorTheme().darkHeadline,
    ),
    headline3: TextStyle(
      color: MyColorTheme().darkHeadline,
    ),
    headline4: TextStyle(
      color: MyColorTheme().darkHeadline,
    ),
    headline5: TextStyle(
      color: MyColorTheme().darkHeadline,
    ),
    headline6: TextStyle(
      color: MyColorTheme().darkHeadline,
    ),
    button: TextStyle(
      color: MyColorTheme().darkButtonText,
    ),
    overline: TextStyle(
      color: MyColorTheme().darkBodyText,
    ),
  );
}
