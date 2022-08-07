abstract class Dao<T> {
  const Dao(this.name);

  final String name;

  Future<T?> get(int id);

  Future<List<T>> getAll();

  /// Add new object to store.
  Future<int?> insert(T value);

  /// Update value if the object exists in store.
  Future<int> update(T value);

  /// Update value if the object exists in store otherwise add new object to store.
  Future<T> put(T value);

  Future<int> delete(T value);

  Future<int> clear();
}
