import 'package:flutter/material.dart';

abstract class ConstantColors{
  static const Color lightPrimaryColor = Color(0xFF14A391);
  static const Color lightScaffoldBackgroundColor = Color(0xFFFFFFFF);
  static const Color lightShadowColor = Color(0xFF000000);
  static const Color lightHintColor = Color(0xFFB4B4B4);
  static const Color lightDisabledColor = Color(0xFFEDEDED);
  static const Color lightIndicatorColor = Color(0xFFD6B029);
  static const Color lightErrorColor = Color(0xFFE84521);

  // TODO: choose dark mode colors
  static const Color darkPrimaryColor = Color(0xFF14A391);
  static const Color darkScaffoldBackgroundColor = Color(0xFF012116);
  static const Color darkShadowColor = Color(0xFFE1E1E1);
  static const Color darkHintColor = Color(0xFFCBCBCB);
  static const Color darkDisabledColor = Color(0xFF4B4A4A);
  static const Color darkIndicatorColor = Color(0xFFD6B029);
  static const Color darkErrorColor = Color(0xFFE84521);
}

abstract class ConstantHTTP{
  static const String university = 'kubsu';
}

abstract class ConstantMessages{
  static const String settings = 'Настройки';
  static const String back = 'Назад';
  static const String exit = 'Выход';
  static const String choose = 'Выбрать';
  static const String clear = 'Очистить';
  static const String less = 'Меньше';
  static const String more = 'Больше';
  static const String additional = 'Дополнительно';
  static const String obscure = 'Видимость';
}

abstract class ConstantDBData{
  static const String lightThemeValue = 'Светлая';
  static const String darkThemeValue = 'Темная';
  static const String systemThemeValue = 'Системная';

}