import 'package:common/common.dart';
import 'package:sembast/sembast.dart';

import '../local_db.dart';

class LectureDao {
  LectureDao(this.name, this._localDB)
      : _store = intMapStoreFactory.store(name);

  final String name;
  final LocalDB _localDB;
  final StoreRef<int, Map<String, Object?>> _store;

  Future<Database> get _db async => _localDB.db;

  Future<List<Lecture>> getAll() async {
    final snapshots = await _store.find(await _db);

    return snapshots.map<Lecture>((e) => Lecture.fromJson(e.value)).toList();
  }

  Future<int> insert(Lecture lecture) async {
    return _store.add(await _db, lecture.toJson());
  }

  Future<int> update(Lecture lecture) async {
    final finder =
        Finder(filter: Filter.custom((e) => e.value['id'] == lecture.id));

    return _store.update(
      await _db,
      lecture.toJson(),
      finder: finder,
    );
  }

  Future<int> delete(Lecture lecture) async {
    final finder = Finder(filter: Filter.byKey(lecture.id));

    return _store.delete(await _db, finder: finder);
  }

  Future<int> clear() async {
    return _store.delete(await _db);
  }
}
