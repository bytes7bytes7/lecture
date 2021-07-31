import 'package:flutter/material.dart';

import '../constants.dart';

final ThemeData lightTheme = ThemeData(
  focusColor: ConstantColors.focusColor,
  scaffoldBackgroundColor: ConstantColors.scaffoldBackgroundColor,
  disabledColor: ConstantColors.disabledColor,
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: ConstantColors.focusColor,
    ),
    subtitle1: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: ConstantColors.disabledColor,
    ),
  ),
);
