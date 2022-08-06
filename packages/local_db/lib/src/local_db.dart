import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class LocalDB {
  LocalDB(this.name);

  final String name;

  Database? _db;

  Future<Database> get db async {
    final db = _db;
    if (db != null) {
      return db;
    }

    return _db = await _openDB();
  }

  Future<Database> _openDB() async {
    final dir = await getApplicationDocumentsDirectory();
    return databaseFactoryIo.openDatabase(join(dir.path, name));
  }
}
