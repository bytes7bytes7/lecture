import 'package:common/common.dart';

import '../local_db.dart';
import 'dao.dart';
import 'lecture_dao.dart';

class DaoFactory {
  const DaoFactory(this._localDB);

  final LocalDB _localDB;

  Dao<Lecture> drafts() => LectureDao('drafts', _localDB);

  Dao<Lecture> bookmarks() => LectureDao('bookmarks', _localDB);
}
