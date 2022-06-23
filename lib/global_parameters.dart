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

  static ValueNotifier<String> facultyNotifier = ValueNotifier('');
  static ValueNotifier<String> levelNotifier = ValueNotifier('');
  static ValueNotifier<String> semesterNotifier = ValueNotifier('');
  static ValueNotifier<String> subjectNotifier = ValueNotifier('');

  static List<String> faculties = [];
  static List<String> levels = [];
  static List<String> subjects = [];
  static int semesters = 0;

  static ValueNotifier<String> themeNotifier = ValueNotifier('Светлая');
}
