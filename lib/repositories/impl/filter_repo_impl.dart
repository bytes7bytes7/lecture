import 'package:rest_client/rest_client.dart';

import '../interface/filter_repo.dart';

class FilterRepoImpl implements FilterRepo {
  @override
  Future<List<User>> findAuthor(String query) {
    // TODO: implement findAuthor
    throw UnimplementedError();
  }

  @override
  Future<List<String>> findInstitution(String query) {
    // TODO: implement findInstitution
    throw UnimplementedError();
  }

  @override
  Future<List<String>> findSubject(String query) {
    // TODO: implement findSubject
    throw UnimplementedError();
  }
}
