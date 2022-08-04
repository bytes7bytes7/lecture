import 'package:common/common.dart';
import 'package:rxdart/rxdart.dart';

abstract class AuthRepo {
  const AuthRepo();

  ValueStream<User> get user;

  void dispose();

  Future<void> signUp(String login, String password);

  Future<void> verifyCode(String code);

  Future<void> setPersonalInfo({
    required String firstName,
    required String lastName,
    required String? middleName,
  });

  Future<void> signIn(String login, String password);

  Future<void> recover(String login);

  Future<void> changePassword(String password);

  Future<void> logOut();
}
