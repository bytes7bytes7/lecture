import 'package:flutter/material.dart';

abstract class GlobalParameters {
  static ValueNotifier<String> facultyNotifier = ValueNotifier('');
  static ValueNotifier<String> levelNotifier = ValueNotifier('');
  //static ValueNotifier<String> semesterNotifier = ValueNotifier('');
  static ValueNotifier<String> subjectNotifier = ValueNotifier('');
}
