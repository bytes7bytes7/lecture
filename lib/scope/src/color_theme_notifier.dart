import 'dart:async';

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

  static AdaptiveThemeMode toMode(ColorTheme theme) {
    switch (theme) {
      case ColorTheme.light:
        return AdaptiveThemeMode.light;
      case ColorTheme.dark:
        return AdaptiveThemeMode.dark;
      case ColorTheme.system:
        return AdaptiveThemeMode.system;
    }
  }
}

class ColorThemeNotifier extends StateNotifier<ColorTheme> {
  ColorThemeNotifier(
    super.state, {
    required Ref ref,
    required Provider<GlobalKey<NavigatorState>> navigatorKey,
  })  : _ref = ref,
        _navigatorKey = navigatorKey {
    _init();
  }

  final Ref _ref;
  final Provider<GlobalKey<NavigatorState>> _navigatorKey;
  late final StreamSubscription _sub;

  BuildContext? get _context => _ref.read(_navigatorKey).currentContext;

  @override
  void dispose() {
    _sub.cancel();

    super.dispose();
  }

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
