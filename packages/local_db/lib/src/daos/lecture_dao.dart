import 'package:common/common.dart';
import 'package:sembast/sembast.dart';

import '../local_db.dart';
import 'dao.dart';

class LectureDao implements Dao<Lecture> {
  LectureDao(this.name, this._localDB)
      : _store = StoreRef<int, Map<String, Object?>>(name);

  @override
  final String name;

  final LocalDB _localDB;
  final StoreRef<int, Map<String, Object?>> _store;

  Future<Database> get _db async => _localDB.db;

  @override
  Future<Lecture?> get(int id) async {
    final finder = Finder(
      filter: Filter.byKey(id),
    );

    final snapshot = await _store.findFirst(
      await _db,
      finder: finder,
    );

    if (snapshot != null) {
      return Lecture.fromJson(snapshot.value);
    }

    return null;
  }

  @override
  Future<List<Lecture>> getAll() async {
    final snapshots = await _store.find(await _db);

    return snapshots.map<Lecture>((e) => Lecture.fromJson(e.value)).toList();
  }

  @override
  Future<int?> insert(Lecture value) async {
    return _store.record(value.id).add(await _db, value.toJson());
  }

  @override
  Future<int> update(Lecture value) async {
    final finder = Finder(
      filter: Filter.byKey(value.id),
    );

    return _store.update(
      await _db,
      value.toJson(),
      finder: finder,
    );
  }

  @override
  Future<Lecture> put(Lecture value) async {
    final map = await _store.record(value.id).put(await _db, value.toJson());
    return Lecture.fromJson(map);
  }

  @override
  Future<int> delete(Lecture value) async {
    final finder = Finder(filter: Filter.byKey(value.id));

    return _store.delete(await _db, finder: finder);
  }

  @override
  Future<int> clear() async {
    return _store.delete(await _db);
  }
}
