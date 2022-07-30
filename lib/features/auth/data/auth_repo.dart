import '../../../l10n/l10n.dart';

enum AuthStatus {
  unknown,
  loggedOut,
  signUp,
  wrongCred,
  noLoginFound,
  loginAlreadyExists,
  wrongCode,
  verifiedSignUp,
  verifiedRecover,
  loggedIn,
  recover;

  String toStr(AppLocalizations l10n) {
    switch (this) {
      case AuthStatus.wrongCred:
        return l10n.wrongLoginOrPasswd;
      case AuthStatus.noLoginFound:
        return l10n.noLoginFound;
      case AuthStatus.loginAlreadyExists:
        return l10n.loginAlreadyExists;
      case AuthStatus.wrongCode:
        return l10n.wrongCode;
      default:
        return '';
    }
  }
}

abstract class AuthRepo {
  const AuthRepo();

  Stream<AuthStatus> get status;

  void dispose();

  Future<void> signUp(String login, String password);

  Future<void> verifyCode(String code);

  Future<void> setPersonalInfo({
    required String firstName,
    required String lastName,
    required String? middleName,
  });

  Future<void> logOut();
}
