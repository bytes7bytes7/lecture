import '../../../l10n/l10n.dart';

enum AuthStatus {
  loggedOut,
  signUp,
  recover,
  wrongCred,
  noLoginFound,
  loggedIn,
  loginAlreadyExists;

  String toStr(AppLocalizations l10n) {
    switch (this) {
      case AuthStatus.wrongCred:
        return l10n.wrongLoginOrPasswd;
      case AuthStatus.noLoginFound:
        return l10n.noLoginFound;
      case AuthStatus.loginAlreadyExists:
        return l10n.loginAlreadyExists;
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

// TODO: add other methods
}
