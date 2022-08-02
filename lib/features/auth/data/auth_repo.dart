import 'package:rest_client/rest_client.dart';
import 'package:rxdart/rxdart.dart';

enum AuthState {
  loggedOut,
  signedUp,
  verifiedSignUp,
  verifiedRecover,
  loggedIn,
  recover,
}

abstract class AuthRepo {
  const AuthRepo();

  ValueStream<User> get user;

  void dispose();

  Future<AuthState> signUp(String login, String password);

  Future<AuthState> verifyCode(String code);

  Future<AuthState> setPersonalInfo({
    required String firstName,
    required String lastName,
    required String? middleName,
  });

  Future<AuthState> logOut();
}
