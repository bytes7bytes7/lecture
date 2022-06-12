import 'package:flutter/material.dart';

import '../constants/colors.dart' as const_colors;
import '../constants/fonts.dart' as const_fonts;

final ThemeData darkTheme = ThemeData(
  primaryColor: const_colors.darkPrimaryColor,
  scaffoldBackgroundColor: const_colors.darkScaffoldBackgroundColor,
  shadowColor: const_colors.darkShadowColor,
  hintColor: const_colors.darkHintColor,
  disabledColor: const_colors.darkDisabledColor,
  indicatorColor: const_colors.darkIndicatorColor,
  errorColor: const_colors.darkErrorColor,
  textTheme: const TextTheme(
    headline1: TextStyle(
      fontSize: const_fonts.headline1Size,
      fontWeight: FontWeight.bold,
      fontFamily: const_fonts.playfairDisplaySC,
      color: const_colors.darkShadowColor,
    ),
    headline2: TextStyle(
      fontSize: const_fonts.headline2Size,
      fontWeight: FontWeight.bold,
      fontFamily: const_fonts.roboto,
      color: const_colors.darkShadowColor,
    ),
    headline3: TextStyle(
      fontSize: const_fonts.headline3Size,
      fontWeight: FontWeight.bold,
      fontFamily: const_fonts.roboto,
      color: const_colors.darkShadowColor,
    ),
    bodyText1: TextStyle(
      fontSize: const_fonts.bodyText1Size,
      fontWeight: FontWeight.normal,
      fontFamily: const_fonts.roboto,
      color: const_colors.darkShadowColor,
    ),
    subtitle1: TextStyle(
      fontSize: const_fonts.subtitle1Size,
      fontWeight: FontWeight.bold,
      fontFamily: const_fonts.roboto,
      color: const_colors.darkShadowColor,
    ),
  ),
);
