part of 'themes.dart';

// TODO: choose dark mode colors
final ThemeData darkTheme = ThemeData(
  primaryColor: _Colors.mountainMeadow,
  scaffoldBackgroundColor: _Colors.shark,
  shadowColor: _Colors.silverChalice,
  hintColor: _Colors.doveGray,
  disabledColor: _Colors.mineShaft,
  indicatorColor: _Colors.hokeyPokey,
  errorColor: _Colors.cinnabar,
  dividerColor: _Colors.doveGray,
  textTheme: _darkTextTheme,
  splashColor: _Colors.mountainMeadow.withOpacity(
    const_measures.tinyOpacity,
  ),
  highlightColor: _Colors.mountainMeadow.withOpacity(
    const_measures.smallOpacity,
  ),
  iconTheme: const IconThemeData(
    color: _Colors.mountainMeadow,
    size: const_measures.smallIconSize,
  ),
  appBarTheme: AppBarTheme(
    elevation: const_measures.appBarElevation,
    backgroundColor: _Colors.shark,
    centerTitle: true,
    titleTextStyle: _darkTextTheme.headline5,
    iconTheme: const IconThemeData(
      color: _Colors.mountainMeadow,
    ),
  ),
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: _Colors.mountainMeadow,
    linearTrackColor: _Colors.shark,
    circularTrackColor: _Colors.shark,
    refreshBackgroundColor: _Colors.shark,
  ),
  cardTheme: CardTheme(
    shadowColor: _Colors.silverChalice,
    color: _Colors.shark,
    shape: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        const_measures.mainBorderRadius,
      ),
    ),
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: _Colors.mountainMeadow,
    selectionColor: _Colors.mountainMeadow.withOpacity(
      const_measures.smallOpacity,
    ),
    selectionHandleColor: _Colors.mountainMeadow,
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      overlayColor: MaterialStateProperty.all(
        _Colors.mountainMeadow.withOpacity(
          const_measures.tinyOpacity,
        ),
      ),
      textStyle: MaterialStateProperty.all(
        _darkTextTheme.subtitle2?.copyWith(
          decoration: TextDecoration.underline,
        ),
      ),
      foregroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return _Colors.silverChalice.withOpacity(
              const_measures.smallOpacity,
            );
          }

          return _Colors.silverChalice;
        },
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
          return _Colors.mountainMeadow.withOpacity(
            const_measures.smallOpacity,
          );
        }

        return _Colors.mountainMeadow;
      }),
      foregroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return _Colors.gallery.withOpacity(
            const_measures.midOpacity,
          );
        }

        return _Colors.gallery;
      }),
      overlayColor: MaterialStateProperty.all(
        _Colors.gallery.withOpacity(
          const_measures.smallOpacity,
        ),
      ),
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
        _darkTextTheme.subtitle2?.copyWith(
          color: _Colors.shark,
        ),
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: _darkTextTheme.bodyText1?.copyWith(
      color: _Colors.doveGray,
    ),
    isCollapsed: true,
    enabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(
        color: _Colors.doveGray,
      ),
    ),
    focusedBorder: const UnderlineInputBorder(
      borderSide: BorderSide(
        color: _Colors.mountainMeadow,
      ),
    ),
    errorBorder: const UnderlineInputBorder(
      borderSide: BorderSide(
        color: _Colors.cinnabar,
      ),
    ),
    disabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(
        color: _Colors.mineShaft,
      ),
    ),
  ),
  popupMenuTheme: PopupMenuThemeData(
    color: _Colors.shark,
    textStyle: _darkTextTheme.bodyText1,
    elevation: const_measures.smallElevation,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        const_measures.mainBorderRadius,
      ),
    ),
  ),
  snackBarTheme: SnackBarThemeData(
    behavior: SnackBarBehavior.floating,
    backgroundColor: _Colors.mountainMeadow,
    contentTextStyle: _darkTextTheme.subtitle1?.copyWith(
      color: _Colors.gallery,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        const_measures.mainBorderRadius,
      ),
    ),
  ),
);

const _darkTextTheme = TextTheme(
  headline3: TextStyle(
    fontSize: _Fonts.headline4Size,
    fontWeight: FontWeight.bold,
    fontFamily: _Fonts.playfairDisplaySC,
    color: _Colors.white,
  ),
  headline4: TextStyle(
    fontSize: _Fonts.headline4Size,
    fontWeight: FontWeight.bold,
    fontFamily: _Fonts.playfairDisplaySC,
    color: _Colors.silverChalice,
  ),
  headline5: TextStyle(
    fontSize: _Fonts.headline5Size,
    fontWeight: FontWeight.bold,
    fontFamily: _Fonts.roboto,
    color: _Colors.silverChalice,
  ),
  headline6: TextStyle(
    fontSize: _Fonts.headline6Size,
    fontWeight: FontWeight.bold,
    fontFamily: _Fonts.roboto,
    color: _Colors.silverChalice,
  ),
  bodyText1: TextStyle(
    fontSize: _Fonts.bodyText1Size,
    fontWeight: FontWeight.normal,
    fontFamily: _Fonts.roboto,
    color: _Colors.silverChalice,
  ),
  subtitle1: TextStyle(
    fontSize: _Fonts.subtitle1Size,
    fontWeight: FontWeight.normal,
    fontFamily: _Fonts.roboto,
    color: _Colors.silverChalice,
  ),
  subtitle2: TextStyle(
    fontSize: _Fonts.subtitle2Size,
    fontWeight: FontWeight.bold,
    fontFamily: _Fonts.roboto,
    color: _Colors.silverChalice,
  ),
);
