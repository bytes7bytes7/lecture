import 'package:flutter/material.dart';

abstract class GlobalParameters {
  static ValueNotifier<bool> confirmOverlayNotifier = ValueNotifier(false);
  static ValueNotifier<bool> personalInfoOverlayNotifier = ValueNotifier(false);

  static String pin = '';

  static void setOverlayConfigToDefault() {
    confirmOverlayNotifier.value = false;
    personalInfoOverlayNotifier.value = false;
    pin = '';
  }
}
