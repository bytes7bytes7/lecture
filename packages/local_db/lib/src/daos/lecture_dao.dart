import 'package:common/common.dart';
import 'package:sembast/sembast.dart';

import '../local_db.dart';
import 'dao.dart';

class LectureDao implements Dao<Lecture> {
  LectureDao(this.name, this._localDB)
      : _store = intMapStoreFactory.store(name);

  @override
  final String name;

  final LocalDB _localDB;
  final StoreRef<int, Map<String, Object?>> _store;

  Future<Database> get _db async => _localDB.db;

  @override
  Future<List<Lecture>> getAll() async {
    final snapshots = await _store.find(await _db);

    return snapshots.map<Lecture>((e) => Lecture.fromJson(e.value)).toList();
  }

  @override
  Future<int> insert(Lecture lecture) async {
    // not published yet
    if (lecture.id == 0) {
      return _store.add(
        await _db,
        lecture.copyWith(id: DateTime.now().millisecondsSinceEpoch).toJson(),
      );
    }

    return _store.add(await _db, lecture.toJson());
  }

  @override
  Future<int> update(Lecture lecture) async {
    final finder = Finder(
      filter: Filter.custom((e) {
        final value = e.value;
        if (value is Map<String, Object?>) {
          return value['id'] == lecture.id;
        }

        return false;
      }),
    );

    return _store.update(
      await _db,
      lecture.toJson(),
      finder: finder,
    );
  }

  @override
  Future<int> delete(Lecture lecture) async {
    final finder = Finder(filter: Filter.byKey(lecture.id));

    return _store.delete(await _db, finder: finder);
  }

  @override
  Future<int> clear() async {
    return _store.delete(await _db);
  }
}
