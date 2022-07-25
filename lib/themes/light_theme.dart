import 'package:flutter/material.dart';

import '../constants/colors.dart' as const_colors;
import '../constants/fonts.dart' as const_fonts;
import '../constants/measures.dart' as const_measures;

final ThemeData lightTheme = ThemeData(
  primaryColor: const_colors.mountainMeadow,
  scaffoldBackgroundColor: const_colors.white,
  shadowColor: const_colors.black,
  hintColor: const_colors.nobel,
  disabledColor: const_colors.gallery,
  indicatorColor: const_colors.hokeyPokey,
  errorColor: const_colors.cinnabar,
  dividerColor: const_colors.nobel,
  textTheme: _textTheme,
  appBarTheme: AppBarTheme(
    elevation: const_measures.appBarElevation,
    backgroundColor: const_colors.white,
    centerTitle: true,
    titleTextStyle: _textTheme.headline2,
    iconTheme: const IconThemeData(
      color: const_colors.mountainMeadow,
    ),
  ),
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: const_colors.mountainMeadow,
    linearTrackColor: const_colors.white,
    circularTrackColor: const_colors.white,
    refreshBackgroundColor: const_colors.white,
  ),
  cardTheme: CardTheme(
    shadowColor: const_colors.black,
    color: const_colors.white,
    shape: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        const_measures.mainBorderRadius,
      ),
    ),
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: const_colors.mountainMeadow,
    selectionColor: const_colors.mountainMeadow.withOpacity(
      const_measures.opacity,
    ),
    selectionHandleColor: const_colors.mountainMeadow,
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(
          horizontal: const_measures.midPadding,
          vertical: const_measures.smallPadding,
        ),
      ),
      backgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return const_colors.mountainMeadow.withOpacity(
            const_measures.opacity,
          );
        }

        return const_colors.mountainMeadow;
      }),
      foregroundColor: MaterialStateProperty.all(const_colors.white),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            const_measures.buttonBorderRadius,
          ),
        ),
      ),
      side: MaterialStateProperty.all(
        const BorderSide(
          style: BorderStyle.none,
        ),
      ),
      textStyle: MaterialStateProperty.all(
        _textTheme.subtitle2?.copyWith(
          color: const_colors.white,
        ),
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: _textTheme.bodyText1?.copyWith(
      color: const_colors.nobel,
    ),
    isCollapsed: true,
    enabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(
        color: const_colors.nobel,
      ),
    ),
    focusedBorder: const UnderlineInputBorder(
      borderSide: BorderSide(
        color: const_colors.mountainMeadow,
      ),
    ),
    errorBorder: const UnderlineInputBorder(
      borderSide: BorderSide(
        color: const_colors.cinnabar,
      ),
    ),
  ),
  popupMenuTheme: PopupMenuThemeData(
    color: const_colors.white,
    textStyle: _textTheme.bodyText1,
    elevation: const_measures.smallElevation,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        const_measures.mainBorderRadius,
      ),
    ),
  ),
);

const _textTheme = TextTheme(
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
    fontWeight: FontWeight.normal,
    fontFamily: const_fonts.roboto,
    color: const_colors.black,
  ),
  subtitle2: TextStyle(
    fontSize: const_fonts.subtitle2Size,
    fontWeight: FontWeight.bold,
    fontFamily: const_fonts.roboto,
    color: const_colors.black,
  ),
);
