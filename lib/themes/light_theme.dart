import 'package:flutter/material.dart';

import '../constants.dart';

final ThemeData lightTheme = ThemeData(
  primaryColor: ConstantColors.primaryColor,
  scaffoldBackgroundColor: ConstantColors.scaffoldBackgroundColor,
  shadowColor: ConstantColors.shadowColor,
  hintColor: ConstantColors.hintColor,
  disabledColor: ConstantColors.disabledColor,
  hoverColor: ConstantColors.hoverColor,
  indicatorColor: ConstantColors.indicatorColor,
  errorColor: ConstantColors.errorColor,
  textTheme: const TextTheme(
    headline1: TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'PlayfairDisplaySC',
      color: ConstantColors.shadowColor,
    ),
    headline2: TextStyle(
      fontSize: 23.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto',
      color: ConstantColors.shadowColor,
    ),
    headline3: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto',
      color: ConstantColors.shadowColor,
    ),
    bodyText1: TextStyle(
      fontSize: 17.0,
      fontWeight: FontWeight.normal,
      fontFamily: 'Roboto',
      color: ConstantColors.shadowColor,
    ),
    subtitle1: TextStyle(
      fontSize: 17.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto',
      color: ConstantColors.shadowColor,
    ),
  ),
);
