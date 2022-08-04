import 'package:common/common.dart';
import 'package:rxdart/rxdart.dart';

import 'lecture_repo.dart';

class LectureRepoImpl implements LectureRepo {
  LectureRepoImpl() : _draftSubject = BehaviorSubject();

  final BehaviorSubject<Lecture> _draftSubject;

  @override
  ValueStream<Lecture> get draft => _draftSubject.stream;

  @override
  void dispose() {
    _draftSubject.close();
  }

  @override
  Future<void> saveDraft(Lecture draft) async {}

  @override
  Future<void> loadDraft() async {}
}
