import 'package:flutter/material.dart';

import '../constants/colors.dart' as const_colors;
import '../constants/fonts.dart' as const_fonts;

final ThemeData lightTheme = ThemeData(
  primaryColor: const_colors.lightPrimaryColor,
  scaffoldBackgroundColor: const_colors.lightScaffoldBackgroundColor,
  shadowColor: const_colors.lightShadowColor,
  hintColor: const_colors.lightHintColor,
  disabledColor: const_colors.lightDisabledColor,
  indicatorColor: const_colors.lightIndicatorColor,
  errorColor: const_colors.lightErrorColor,
  textTheme: const TextTheme(
    headline1: TextStyle(
      fontSize: const_fonts.headline1Size,
      fontWeight: FontWeight.bold,
      fontFamily: const_fonts.playfairDisplaySC,
      color: const_colors.lightShadowColor,
    ),
    headline2: TextStyle(
      fontSize: const_fonts.headline2Size,
      fontWeight: FontWeight.bold,
      fontFamily: const_fonts.roboto,
      color: const_colors.lightShadowColor,
    ),
    headline3: TextStyle(
      fontSize: const_fonts.headline3Size,
      fontWeight: FontWeight.bold,
      fontFamily: const_fonts.roboto,
      color: const_colors.lightShadowColor,
    ),
    bodyText1: TextStyle(
      fontSize: const_fonts.bodyText1Size,
      fontWeight: FontWeight.normal,
      fontFamily: const_fonts.roboto,
      color: const_colors.lightShadowColor,
    ),
    subtitle1: TextStyle(
      fontSize: const_fonts.subtitle1Size,
      fontWeight: FontWeight.bold,
      fontFamily: const_fonts.roboto,
      color: const_colors.lightShadowColor,
    ),
  ),
);
