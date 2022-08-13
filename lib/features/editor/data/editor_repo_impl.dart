import 'package:common/common.dart';
import 'package:local_db/local_db.dart';
import 'package:rxdart/rxdart.dart';

import 'editor_repo.dart';
import 'exceptions.dart';

class EditorRepoImpl implements EditorRepo {
  EditorRepoImpl(this._lectureDao, this._contentDao)
      : _lectureSubject = BehaviorSubject(),
        _contentSubject = BehaviorSubject();

  final Dao<Lecture> _lectureDao;
  final Dao<Content> _contentDao;
  final BehaviorSubject<Lecture> _lectureSubject;
  final BehaviorSubject<Content> _contentSubject;

  @override
  ValueStream<Lecture> get lecture => _lectureSubject.stream;

  @override
  ValueStream<Content> get content => _contentSubject.stream;

  @override
  void dispose() {
    _lectureSubject.close();
    _contentSubject.close();
  }

  @override
  Future<void> saveDraft(Lecture lecture, Content content) async {
    if (lecture.id == 0 || content.id == 0) {
      final tmpId = -DateTime.now().millisecondsSinceEpoch;
      final updatedLecture = lecture.copyWith(id: tmpId);
      final updatedContent = content.copyWith(id: tmpId);

      final lectureId = await _lectureDao.insert(updatedLecture);
      final contentId = await _contentDao.insert(updatedContent);
      if (lectureId != null && contentId != null) {
        _lectureSubject.add(updatedLecture);
        _contentSubject.add(updatedContent);
      } else {
        throw const EditorException.notAddedDraft();
      }
    } else {
      final savedLecture = await _lectureDao.put(lecture);
      final savedContent = await _contentDao.put(content);

      _lectureSubject.add(savedLecture);
      _contentSubject.add(savedContent);
    }
  }

  @override
  Future<void> loadDraft(int id) async {
    final lecture = await _lectureDao.get(id);
    final content = await _contentDao.get(id);

    if (lecture != null && content != null) {
      _lectureSubject.add(lecture);
      _contentSubject.add(content);
    } else {
      throw const EditorException.noDraftFound();
    }
  }

  @override
  Future<void> publish(Lecture lecture, Content content) async {
    throw UnimplementedError();
  }
}
