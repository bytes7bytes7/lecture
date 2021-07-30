import 'package:flutter/material.dart';

import '../constants.dart';

final ThemeData lightTheme = ThemeData(
  focusColor: ConstantColors.focusColor,
  scaffoldBackgroundColor: ConstantColors.scaffoldBackgroundColor,
  disabledColor: ConstantColors.disabledColor,
  textTheme: const TextTheme(
    subtitle1: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: ConstantColors.disabledColor,
    ),
  ),
);