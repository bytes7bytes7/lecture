import 'dart:async';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ColorThemeNotifier extends StateNotifier<AdaptiveThemeMode> {
  ColorThemeNotifier({
    required Ref ref,
    required Provider<GlobalKey<NavigatorState>> navigatorKey,
  })  : _ref = ref,
        _navigatorKey = navigatorKey,
        super(AdaptiveThemeMode.system) {
    _init();
  }

  final Ref _ref;
  final Provider<GlobalKey<NavigatorState>> _navigatorKey;

  BuildContext? get _context => _ref.read(_navigatorKey).currentContext;

  void set(AdaptiveThemeMode value) {
    final context = _context;
    if (context != null) {
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
    }

    state = value;
  }

  Future<void> _init() async {
    final mode = await AdaptiveTheme.getThemeMode();
    if (mode != null) {
      state = mode;
    }
  }
}
