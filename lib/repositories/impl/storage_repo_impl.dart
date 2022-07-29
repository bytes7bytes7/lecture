import 'package:rest_client/rest_client.dart';
import 'package:riverpod/riverpod.dart';

import '../../scope/app_scope.dart';
import '../interface/storage_repo.dart';

class StorageRepoImpl implements StorageRepo {
  StorageRepoImpl(this._ref);

  final ProviderRef _ref;

  @override
  Future<void> saveDraft(Lecture lecture) async {
    _ref.read(AppScope.get().loggerManager).log('save draft');
  }

  @override
  Future<void> deleteDraft(int id) async {
    _ref.read(AppScope.get().loggerManager).log('delete draft');
  }
}
