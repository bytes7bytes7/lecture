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
    Map<String, dynamic> data = {};
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
    LectureRepository.getAllLectures(data).then((List<Lecture> lectureList) {
      if (!_lectureStreamController.isClosed) {
        _lectureStreamController.sink
            .add(LectureState._lectureData(lectureList));
      }
    }).onError((Error error, StackTrace stackTrace) {
      if (!_lectureStreamController.isClosed) {
        _lectureStreamController.sink
            .add(LectureState._lectureError(error, stackTrace));
      }
    });
  }
}

class LectureState {
  LectureState();

  factory LectureState._lectureData(List<Lecture> lectures) = LectureDataState;

  factory LectureState._lectureLoading() = LectureLoadingState;

  factory LectureState._lectureError(Error error, StackTrace stackTrace) =
      LectureErrorState;
}

class LectureInitState extends LectureState {}

class LectureLoadingState extends LectureState {}

class LectureErrorState extends LectureState {
  LectureErrorState(this.error, this.stackTrace);

  final Error error;
  final StackTrace stackTrace;
}

class LectureDataState extends LectureState {
  LectureDataState(this.lectures);

  final List<Lecture> lectures;
}
