import 'package:rest_client/rest_client.dart';

/// Local Storage Repo.
abstract class StorageRepo {
  Future<void> saveDraft(Lecture lecture);

  Future<void> deleteDraft(int id);
}
