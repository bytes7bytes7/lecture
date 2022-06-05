import 'package:flutter/material.dart';

import '../constants/colors.dart' as const_colors;

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
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'PlayfairDisplaySC',
      color: const_colors.lightShadowColor,
    ),
    headline2: TextStyle(
      fontSize: 23.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto',
      color: const_colors.lightShadowColor,
    ),
    headline3: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto',
      color: const_colors.lightShadowColor,
    ),
    bodyText1: TextStyle(
      fontSize: 17.0,
      fontWeight: FontWeight.normal,
      fontFamily: 'Roboto',
      color: const_colors.lightShadowColor,
    ),
    subtitle1: TextStyle(
      fontSize: 17.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto',
      color: const_colors.lightShadowColor,
    ),
  ),
);
