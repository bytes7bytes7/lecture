import 'package:rest_client/rest_client.dart';
import 'package:riverpod/riverpod.dart';

import '../interface/storage_repo.dart';

class StorageRepoImpl implements StorageRepo {
  StorageRepoImpl(this._ref);

  final ProviderRef _ref;

  @override
  Future<void> saveDraft(Lecture lecture) {
    // TODO: implement saveDraft
    throw UnimplementedError();
  }

  @override
  Future<void> deleteDraft(int id) {
    // TODO: implement deleteDraft
    throw UnimplementedError();
  }
}
