import 'package:rest_client/rest_client.dart';
import 'package:rxdart/rxdart.dart';

enum AuthState {
  cancelRecovery,
  cancelVerification,
  loggedIn,
  loggedOut,
  openRecover,
  openSignIn,
  openSignUp,
  requestedRecover,
  signedUp,
  verifiedRecover,
  verifiedSignUp,
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

  Future<AuthState> signIn(String login, String password);

  Future<AuthState> recover(String login);

  Future<AuthState> logOut();
}
