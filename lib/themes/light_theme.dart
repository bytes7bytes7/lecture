part of 'themes.dart';

final ThemeData lightTheme = ThemeData(
  primaryColor: _Colors.mountainMeadow,
  scaffoldBackgroundColor: _Colors.white,
  shadowColor: _Colors.black,
  hintColor: _Colors.nobel,
  disabledColor: _Colors.gallery,
  indicatorColor: _Colors.hokeyPokey,
  errorColor: _Colors.cinnabar,
  dividerColor: _Colors.nobel,
  textTheme: _lightTextTheme,
  appBarTheme: AppBarTheme(
    elevation: const_measures.appBarElevation,
    backgroundColor: _Colors.white,
    centerTitle: true,
    titleTextStyle: _lightTextTheme.headline5,
    iconTheme: const IconThemeData(
      color: _Colors.mountainMeadow,
    ),
  ),
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: _Colors.mountainMeadow,
    linearTrackColor: _Colors.white,
    circularTrackColor: _Colors.white,
    refreshBackgroundColor: _Colors.white,
  ),
  cardTheme: CardTheme(
    shadowColor: _Colors.black,
    color: _Colors.white,
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
        _lightTextTheme.subtitle2?.copyWith(
          decoration: TextDecoration.underline,
        ),
      ),
      foregroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return _Colors.black.withOpacity(
              const_measures.smallOpacity,
            );
          }

          return _Colors.black;
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
      foregroundColor: MaterialStateProperty.all(
        _Colors.white,
      ),
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
        _lightTextTheme.subtitle2?.copyWith(
          color: _Colors.white,
        ),
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: _lightTextTheme.bodyText1?.copyWith(
      color: _Colors.nobel,
    ),
    isCollapsed: true,
    enabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(
        color: _Colors.nobel,
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
  ),
  popupMenuTheme: PopupMenuThemeData(
    color: _Colors.white,
    textStyle: _lightTextTheme.bodyText1,
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
    contentTextStyle: _lightTextTheme.subtitle1?.copyWith(
      color: _Colors.white,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        const_measures.mainBorderRadius,
      ),
    ),
  ),
);

const _lightTextTheme = TextTheme(
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
    color: _Colors.black,
  ),
  headline5: TextStyle(
    fontSize: _Fonts.headline5Size,
    fontWeight: FontWeight.bold,
    fontFamily: _Fonts.roboto,
    color: _Colors.black,
  ),
  headline6: TextStyle(
    fontSize: _Fonts.headline6Size,
    fontWeight: FontWeight.bold,
    fontFamily: _Fonts.roboto,
    color: _Colors.black,
  ),
  bodyText1: TextStyle(
    fontSize: _Fonts.bodyText1Size,
    fontWeight: FontWeight.normal,
    fontFamily: _Fonts.roboto,
    color: _Colors.black,
  ),
  subtitle1: TextStyle(
    fontSize: _Fonts.subtitle1Size,
    fontWeight: FontWeight.normal,
    fontFamily: _Fonts.roboto,
    color: _Colors.black,
  ),
  subtitle2: TextStyle(
    fontSize: _Fonts.subtitle2Size,
    fontWeight: FontWeight.bold,
    fontFamily: _Fonts.roboto,
    color: _Colors.black,
  ),
);
