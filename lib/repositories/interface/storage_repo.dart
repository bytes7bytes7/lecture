import 'package:common/common.dart';

/// Local Storage Repo.
abstract class StorageRepo {
  Future<void> saveDraft(Lecture lecture);

  Future<void> deleteDraft(int id);
}
