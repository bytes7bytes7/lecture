import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ColorTheme {
  light,
  dark,
  system;

  static ColorTheme fromMode(AdaptiveThemeMode mode) {
    switch (mode) {
      case AdaptiveThemeMode.light:
        return light;
      case AdaptiveThemeMode.dark:
        return dark;
      case AdaptiveThemeMode.system:
        return system;
    }
  }
}

class ColorThemeNotifier extends StateNotifier<ColorTheme> {
  ColorThemeNotifier(
    super.state, {
    required this.ref,
    required this.navigatorKey,
  }) {
    _init();
  }

  final Ref ref;
  final Provider<GlobalKey<NavigatorState>> navigatorKey;

  BuildContext? get _context => ref.read(navigatorKey).currentContext;

  void set(ColorTheme value) {
    final context = _context;
    if (context != null) {
      switch (value) {
        case ColorTheme.light:
          AdaptiveTheme.of(context).setLight();
          break;
        case ColorTheme.dark:
          AdaptiveTheme.of(context).setDark();
          break;
        case ColorTheme.system:
          AdaptiveTheme.of(context).setSystem();
          break;
      }
    }

    state = value;
  }

  Future<void> _init() async {
    final mode = await AdaptiveTheme.getThemeMode();
    if (mode != null) {
      state = ColorTheme.fromMode(mode);
    }
  }
}
