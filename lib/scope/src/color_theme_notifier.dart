import 'dart:async';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ColorThemeNotifier extends StateNotifier<AdaptiveThemeMode> {
  ColorThemeNotifier() : super(AdaptiveThemeMode.system) {
    _init();
  }

  void set(BuildContext context, AdaptiveThemeMode value) {
    if (value != state) {
      switch (value) {
        case AdaptiveThemeMode.light:
          AdaptiveTheme.of(context).setLight();
          break;
        case AdaptiveThemeMode.dark:
          AdaptiveTheme.of(context).setDark();
          break;
        case AdaptiveThemeMode.system:
          AdaptiveTheme.of(context).setSystem();
          break;
      }

      state = value;
    }
  }

  Future<void> _init() async {
    final mode = await AdaptiveTheme.getThemeMode();
    if (mode != null) {
      state = mode;
    }
  }
}
