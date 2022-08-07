import '../local_db.dart';
import 'dao.dart';
import 'lecture_dao.dart';

class DaoFactory {
  const DaoFactory(this._localDB);

  final LocalDB _localDB;

  Dao notPublishedDrafts() => LectureDao('not_published_drafts', _localDB);

  Dao publishedDrafts() => LectureDao('published_drafts', _localDB);
}
