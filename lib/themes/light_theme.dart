import 'package:flutter/material.dart';

import '../constants/colors.dart' as const_colors;
import '../constants/fonts.dart' as const_fonts;

final ThemeData lightTheme = ThemeData(
  primaryColor: const_colors.mountainMeadow,
  scaffoldBackgroundColor: const_colors.white,
  shadowColor: const_colors.black,
  hintColor: const_colors.nobel,
  disabledColor: const_colors.gallery,
  indicatorColor: const_colors.hokeyPokey,
  errorColor: const_colors.cinnabar,
  textTheme: const TextTheme(
    headline1: TextStyle(
      fontSize: const_fonts.headline1Size,
      fontWeight: FontWeight.bold,
      fontFamily: const_fonts.playfairDisplaySC,
      color: const_colors.black,
    ),
    headline2: TextStyle(
      fontSize: const_fonts.headline2Size,
      fontWeight: FontWeight.bold,
      fontFamily: const_fonts.roboto,
      color: const_colors.black,
    ),
    headline3: TextStyle(
      fontSize: const_fonts.headline3Size,
      fontWeight: FontWeight.bold,
      fontFamily: const_fonts.roboto,
      color: const_colors.black,
    ),
    bodyText1: TextStyle(
      fontSize: const_fonts.bodyText1Size,
      fontWeight: FontWeight.normal,
      fontFamily: const_fonts.roboto,
      color: const_colors.black,
    ),
    subtitle1: TextStyle(
      fontSize: const_fonts.subtitle1Size,
      fontWeight: FontWeight.bold,
      fontFamily: const_fonts.roboto,
      color: const_colors.black,
    ),
  ),
);
