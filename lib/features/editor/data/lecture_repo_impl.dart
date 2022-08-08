import 'package:common/common.dart';
import 'package:local_db/local_db.dart';
import 'package:rxdart/rxdart.dart';

import 'exceptions.dart';
import 'lecture_repo.dart';

class LectureRepoImpl implements LectureRepo {
  LectureRepoImpl(this._dao) : _draftSubject = BehaviorSubject();

  final Dao<Lecture> _dao;
  final BehaviorSubject<Lecture> _draftSubject;

  @override
  ValueStream<Lecture> get draft => _draftSubject.stream;

  @override
  void dispose() {
    _draftSubject.close();
  }

  @override
  Future<void> saveDraft(Lecture draft) async {
    if (draft.id == 0) {
      final updated =
          draft.copyWith(id: -DateTime.now().millisecondsSinceEpoch);
      final id = await _dao.insert(updated);
      if (id != null) {
        _draftSubject.add(updated);
      } else {
        throw const EditorException.notAddedDraft();
      }
    } else {
      final saved = await _dao.put(draft);
      _draftSubject.add(saved);
    }
  }

  @override
  Future<void> loadDraft(int id) async {
    final draft = await _dao.get(id);

    if (draft != null) {
      _draftSubject.add(draft);
    } else {
      throw const EditorException.noDraftFound();
    }
  }
}
