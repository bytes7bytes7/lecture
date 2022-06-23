import 'package:rest_client/rest_client.dart';

abstract class FilterRepo {
  Future<List<String>> findInstitution(String query);

  Future<List<String>> findSubject(String query);

  Future<List<User>> findAuthor(String query);
}
