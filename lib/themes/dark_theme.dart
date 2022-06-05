import 'package:flutter/material.dart';

import '../constants/colors.dart' as const_colors;

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
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'PlayfairDisplaySC',
      color: const_colors.darkShadowColor,
    ),
    headline2: TextStyle(
      fontSize: 23.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto',
      color: const_colors.darkShadowColor,
    ),
    headline3: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto',
      color: const_colors.darkShadowColor,
    ),
    bodyText1: TextStyle(
      fontSize: 17.0,
      fontWeight: FontWeight.normal,
      fontFamily: 'Roboto',
      color: const_colors.darkShadowColor,
    ),
    subtitle1: TextStyle(
      fontSize: 17.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto',
      color: const_colors.darkShadowColor,
    ),
  ),
);
