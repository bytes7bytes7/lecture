import 'package:rest_client/rest_client.dart';

abstract class AccountRepo {
  Future<void> getToken();

  Future<void> refreshToken();

  Future<void> deleteUser();

  Future<void> changeUserInfo();

  Future<User> getUserInfo(int id);
}
