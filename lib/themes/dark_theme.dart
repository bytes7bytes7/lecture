import 'package:flutter/material.dart';

import '../constants/colors.dart' as const_colors;
import '../constants/fonts.dart' as const_fonts;

// TODO: choose dark mode colors
final ThemeData darkTheme = ThemeData(
  primaryColor: const_colors.mountainMeadow,
  scaffoldBackgroundColor: const_colors.holly,
  shadowColor: const_colors.mercury,
  hintColor: const_colors.silver,
  disabledColor: const_colors.tundora,
  indicatorColor: const_colors.hokeyPokey,
  errorColor: const_colors.cinnabar,
  textTheme: const TextTheme(
    headline1: TextStyle(
      fontSize: const_fonts.headline1Size,
      fontWeight: FontWeight.bold,
      fontFamily: const_fonts.playfairDisplaySC,
      color: const_colors.mercury,
    ),
    headline2: TextStyle(
      fontSize: const_fonts.headline2Size,
      fontWeight: FontWeight.bold,
      fontFamily: const_fonts.roboto,
      color: const_colors.mercury,
    ),
    headline3: TextStyle(
      fontSize: const_fonts.headline3Size,
      fontWeight: FontWeight.bold,
      fontFamily: const_fonts.roboto,
      color: const_colors.mercury,
    ),
    bodyText1: TextStyle(
      fontSize: const_fonts.bodyText1Size,
      fontWeight: FontWeight.normal,
      fontFamily: const_fonts.roboto,
      color: const_colors.mercury,
    ),
    subtitle1: TextStyle(
      fontSize: const_fonts.subtitle1Size,
      fontWeight: FontWeight.bold,
      fontFamily: const_fonts.roboto,
      color: const_colors.mercury,
    ),
  ),
);
