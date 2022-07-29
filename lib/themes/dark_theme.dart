import 'package:flutter/material.dart';

import '../constants/colors.dart' as const_colors;
import '../constants/fonts.dart' as const_fonts;
import '../constants/measures.dart' as const_measures;

// TODO: choose dark mode colors
final ThemeData darkTheme = ThemeData(
  primaryColor: const_colors.mountainMeadow,
  scaffoldBackgroundColor: const_colors.shark,
  shadowColor: const_colors.silverChalice,
  hintColor: const_colors.doveGray,
  disabledColor: const_colors.mineShaft,
  indicatorColor: const_colors.hokeyPokey,
  errorColor: const_colors.cinnabar,
  dividerColor: const_colors.doveGray,
  textTheme: _textTheme,
  appBarTheme: AppBarTheme(
    elevation: const_measures.appBarElevation,
    backgroundColor: const_colors.shark,
    centerTitle: true,
    titleTextStyle: _textTheme.headline2,
    iconTheme: const IconThemeData(
      color: const_colors.mountainMeadow,
    ),
  ),
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: const_colors.mountainMeadow,
    linearTrackColor: const_colors.shark,
    circularTrackColor: const_colors.shark,
    refreshBackgroundColor: const_colors.shark,
  ),
  cardTheme: CardTheme(
    shadowColor: const_colors.silverChalice,
    color: const_colors.shark,
    shape: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        const_measures.mainBorderRadius,
      ),
    ),
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: const_colors.mountainMeadow,
    selectionColor: const_colors.mountainMeadow.withOpacity(
      const_measures.smallOpacity,
    ),
    selectionHandleColor: const_colors.mountainMeadow,
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      overlayColor: MaterialStateProperty.all(
        const_colors.mountainMeadow.withOpacity(
          const_measures.tinyOpacity,
        ),
      ),
      textStyle: MaterialStateProperty.all(
        _textTheme.subtitle2?.copyWith(
          decoration: TextDecoration.underline,
        ),
      ),
    ),
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
            const_measures.smallOpacity,
          );
        }

        return const_colors.mountainMeadow;
      }),
      foregroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return const_colors.gallery.withOpacity(
            const_measures.midOpacity,
          );
        }

        return const_colors.gallery;
      }),
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
          color: const_colors.shark,
        ),
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: _textTheme.bodyText1?.copyWith(
      color: const_colors.doveGray,
    ),
    isCollapsed: true,
    enabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(
        color: const_colors.doveGray,
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
    color: const_colors.shark,
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
    color: const_colors.silverChalice,
  ),
  headline2: TextStyle(
    fontSize: const_fonts.headline2Size,
    fontWeight: FontWeight.bold,
    fontFamily: const_fonts.roboto,
    color: const_colors.silverChalice,
  ),
  headline3: TextStyle(
    fontSize: const_fonts.headline3Size,
    fontWeight: FontWeight.bold,
    fontFamily: const_fonts.roboto,
    color: const_colors.silverChalice,
  ),
  bodyText1: TextStyle(
    fontSize: const_fonts.bodyText1Size,
    fontWeight: FontWeight.normal,
    fontFamily: const_fonts.roboto,
    color: const_colors.silverChalice,
  ),
  subtitle1: TextStyle(
    fontSize: const_fonts.subtitle1Size,
    fontWeight: FontWeight.normal,
    fontFamily: const_fonts.roboto,
    color: const_colors.silverChalice,
  ),
  subtitle2: TextStyle(
    fontSize: const_fonts.subtitle2Size,
    fontWeight: FontWeight.bold,
    fontFamily: const_fonts.roboto,
    color: const_colors.silverChalice,
  ),
);
