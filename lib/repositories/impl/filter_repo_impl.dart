import 'package:rest_client/rest_client.dart';
import 'package:riverpod/riverpod.dart';

import '../../scope/app_scope.dart';
import '../interface/filter_repo.dart';

class FilterRepoImpl implements FilterRepo {
  FilterRepoImpl(this._ref);

  final ProviderRef _ref;

  RestClient get _restClient => _ref.read(AppScope.get().restClient);

  @override
  Future<List<String>> findInstitution(String query) async {
    return _restClient.findInstitution(query);
  }

  @override
  Future<List<String>> findSubject(String query) async {
    return _restClient.findSubject(query);
  }

  @override
  Future<List<User>> findAuthor(String query) async {
    return _restClient.findAuthor(query);
  }
}
