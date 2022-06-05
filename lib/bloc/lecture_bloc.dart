import 'dart:async';

import '../global_parameters.dart';
import '../models/lecture.dart';
import '../repositories/lecture_repository.dart';

abstract class LectureBloc {
  static final StreamController<LectureState> _lectureStreamController =
      StreamController<LectureState>.broadcast();

  static Stream<LectureState> get lecture {
    return _lectureStreamController.stream;
  }

  static Future<void> updateAllLectures() async {
    final data = <String, dynamic>{};
    if (GlobalParameters.facultyNotifier.value.isNotEmpty) {
      data['faculty'] = GlobalParameters.facultyNotifier.value;
    }
    if (GlobalParameters.levelNotifier.value.isNotEmpty) {
      data['level'] = GlobalParameters.levelNotifier.value;
    }
    if (GlobalParameters.subjectNotifier.value.isNotEmpty) {
      data['subject'] = GlobalParameters.subjectNotifier.value;
    }
    if (GlobalParameters.semesterNotifier.value.isNotEmpty) {
      data['semester'] = GlobalParameters.semesterNotifier.value;
    }

    _lectureStreamController.sink.add(LectureState._lectureLoading());

    try {
      final lectureList = await LectureRepository.getAllLectures(data);
      if (!_lectureStreamController.isClosed) {
        _lectureStreamController.sink
            .add(LectureState._lectureData(lectureList));
      }
    } catch (e) {
      if (!_lectureStreamController.isClosed) {
        _lectureStreamController.sink.add(LectureState._lectureError(e));
      }
    }
  }

  static Future<void> uploadLecture(Lecture lecture) async {
    try {
      await LectureRepository.uploadLecture(lecture);
    } catch (e) {
      if (!_lectureStreamController.isClosed) {
        _lectureStreamController.sink.add(LectureState._lectureError(e));
      }
    }
  }
}

class LectureState {
  LectureState();

  factory LectureState._lectureData(List<Lecture> lectures) = LectureDataState;

  factory LectureState._lectureLoading() = LectureLoadingState;

  factory LectureState._lectureError(Object error) = LectureErrorState;
}

class LectureInitState extends LectureState {}

class LectureLoadingState extends LectureState {}

class LectureErrorState extends LectureState {
  LectureErrorState(this.error);

  final Object error;
}

class LectureDataState extends LectureState {
  LectureDataState(this.lectures);

  final List<Lecture> lectures;
}
