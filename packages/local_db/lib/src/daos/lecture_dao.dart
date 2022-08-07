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
    final snapshot = await _store.findFirst(
      await _db,
      finder: _finder(id),
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
  Future<int> insert(Lecture value) async {
    return _store.add(await _db, value.toJson());
  }

  @override
  Future<int> update(Lecture value) async {
    return _store.update(
      await _db,
      value.toJson(),
      finder: _finder(value.id),
    );
  }

  @override
  Future<int> put(Lecture value) async {
    final snapshot =
        await _store.findFirst(await _db, finder: _finder(value.id));

    if (snapshot != null) {
      return update(value);
    }

    return insert(value);
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

  Finder _finder(int id) {
    return Finder(
      filter: Filter.custom((e) {
        final value = e.value;
        if (value is Map<String, Object?>) {
          return value['id'] == id;
        }

        return false;
      }),
    );
  }
}
