import 'package:flutter/material.dart';

abstract class GlobalParameters {
  static ValueNotifier<String> facultyNotifier = ValueNotifier('');
  static ValueNotifier<String> levelNotifier = ValueNotifier('');
  static ValueNotifier<String> semesterNotifier = ValueNotifier('');
  static ValueNotifier<String> subjectNotifier = ValueNotifier('');

  static List<String> faculties = [];
  static List<String> levels = [];
  static List<String> subjects = [];
  static int semesters = 0;
}
