import 'package:flutter/material.dart';

import '../constants.dart';

final ThemeData lightTheme = ThemeData(
  primaryColor: ConstantColors.lightPrimaryColor,
  scaffoldBackgroundColor: ConstantColors.lightScaffoldBackgroundColor,
  shadowColor: ConstantColors.lightShadowColor,
  hintColor: ConstantColors.lightHintColor,
  disabledColor: ConstantColors.lightDisabledColor,
  indicatorColor: ConstantColors.lightIndicatorColor,
  errorColor: ConstantColors.lightErrorColor,
  textTheme: const TextTheme(
    headline1: TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'PlayfairDisplaySC',
      color: ConstantColors.lightShadowColor,
    ),
    headline2: TextStyle(
      fontSize: 23.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto',
      color: ConstantColors.lightShadowColor,
    ),
    headline3: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto',
      color: ConstantColors.lightShadowColor,
    ),
    bodyText1: TextStyle(
      fontSize: 17.0,
      fontWeight: FontWeight.normal,
      fontFamily: 'Roboto',
      color: ConstantColors.lightShadowColor,
    ),
    subtitle1: TextStyle(
      fontSize: 17.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto',
      color: ConstantColors.lightShadowColor,
    ),
  ),
);
