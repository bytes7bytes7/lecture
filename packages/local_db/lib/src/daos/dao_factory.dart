import '../local_db.dart';
import 'dao.dart';
import 'lecture_dao.dart';

class DaoFactory {
  const DaoFactory(this._localDB);

  final LocalDB _localDB;

  Dao drafts() => LectureDao('drafts', _localDB);

  Dao bookmarks() => LectureDao('bookmarks', _localDB);
}
