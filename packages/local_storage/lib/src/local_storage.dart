abstract class LocalStorage {
  Future<void> init();

  Future<void> get();

  Future<void> update();

  Future<void> read();
}
