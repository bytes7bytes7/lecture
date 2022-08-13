import 'package:common/common.dart';

import '../local_db.dart';
import 'content_dao.dart';
import 'dao.dart';
import 'lecture_dao.dart';

class DaoFactory {
  const DaoFactory(this._localDB);

  final LocalDB _localDB;

  Dao<Lecture> draftLecture() => LectureDao('drafts_lecture', _localDB);

  Dao<Content> draftContent() => ContentDao('draft_content', _localDB);

  Dao<Lecture> bookmarkLecture() => LectureDao('bookmark_lecture', _localDB);

  Dao<Content> bookmarkContent() => ContentDao('bookmark_content', _localDB);
}
