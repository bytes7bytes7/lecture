import 'package:flutter/material.dart';

import '../constants.dart';

final ThemeData darkTheme = ThemeData(
  primaryColor: ConstantColors.darkPrimaryColor,
  scaffoldBackgroundColor: ConstantColors.darkScaffoldBackgroundColor,
  shadowColor: ConstantColors.darkShadowColor,
  hintColor: ConstantColors.darkHintColor,
  disabledColor: ConstantColors.darkDisabledColor,
  indicatorColor: ConstantColors.darkIndicatorColor,
  errorColor: ConstantColors.darkErrorColor,
  textTheme: const TextTheme(
    headline1: TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'PlayfairDisplaySC',
      color: ConstantColors.darkShadowColor,
    ),
    headline2: TextStyle(
      fontSize: 23.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto',
      color: ConstantColors.darkShadowColor,
    ),
    headline3: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto',
      color: ConstantColors.darkShadowColor,
    ),
    bodyText1: TextStyle(
      fontSize: 17.0,
      fontWeight: FontWeight.normal,
      fontFamily: 'Roboto',
      color: ConstantColors.darkShadowColor,
    ),
    subtitle1: TextStyle(
      fontSize: 17.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto',
      color: ConstantColors.darkShadowColor,
    ),
  ),
);
