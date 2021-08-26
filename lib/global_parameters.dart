import 'package:flutter/material.dart';

import 'bloc/lecture_bloc.dart';

abstract class GlobalParameters {
  static ValueNotifier<bool> confirmOverlayNotifier = ValueNotifier(false);
  static ValueNotifier<bool> personalInfoOverlayNotifier = ValueNotifier(false);


  static ValueNotifier<String> facultyNotifier = ValueNotifier('');
  static ValueNotifier<String> levelNotifier = ValueNotifier('');
  static ValueNotifier<String> semesterNotifier = ValueNotifier('');
  static ValueNotifier<String> subjectNotifier = ValueNotifier('');

  static List<String> faculties = [];
  static List<String> levels = [];
  static List<String> subjects = [];
  static int semesters = 0;

  static ValueNotifier<bool> isFilterChanged = ValueNotifier(false);

  static String _oldFaculty = '';
  static String _oldLevel = '';
  static String _oldSemester = '';
  static String _oldSubject = '';

  static ValueNotifier<String> themeNotifier = ValueNotifier('Светлая');

  static void checkFilter() {
    if (!(_oldFaculty == facultyNotifier.value &&
        _oldLevel == levelNotifier.value &&
        _oldSemester == semesterNotifier.value &&
        _oldSubject == subjectNotifier.value)) {
      isFilterChanged.value = true;
    } else {
      isFilterChanged.value = false;
    }
  }

  static bool isFilterEmpty() {
    return facultyNotifier.value.isEmpty &&
        levelNotifier.value.isEmpty &&
        semesterNotifier.value.isEmpty &&
        subjectNotifier.value.isEmpty;
  }

  static void _clearFilter() {
    facultyNotifier.value = '';
    levelNotifier.value = '';
    semesterNotifier.value = '';
    subjectNotifier.value = '';
  }

  static void _updateFilter() {
    _oldFaculty = facultyNotifier.value;
    _oldLevel = levelNotifier.value;
    _oldSemester = semesterNotifier.value;
    _oldSubject = subjectNotifier.value;
  }

  static void dropFilter() {
    _clearFilter();
    checkFilter();
  }

  static void updateFiler() {
    _updateFilter();
    checkFilter();
    LectureBloc.updateAllLectures();
  }
}
