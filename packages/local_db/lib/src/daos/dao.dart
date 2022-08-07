abstract class Dao<T> {
  const Dao(this.name);

  final String name;

  Future<List<T>> getAll();

  Future<int> insert(T value);

  Future<int> update(T value);

  Future<int> delete(T value);

  Future<int> clear();
}
