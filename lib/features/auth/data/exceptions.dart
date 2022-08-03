class AuthException implements Exception {
  const AuthException();

  const factory AuthException.unknown() = Unknown;

  const factory AuthException.loginAlreadyInUse() = LoginAlreadyInUse;

  const factory AuthException.wrongCred() = WrongCred;

  const factory AuthException.wrongCode() = WrongCode;

  const factory AuthException.noLoginFound() = NoLoginFound;

  const factory AuthException.notValidLogin() = NotValidLogin;
}

class Unknown extends AuthException {
  const Unknown();
}

class LoginAlreadyInUse extends AuthException {
  const LoginAlreadyInUse();
}

class WrongCred extends AuthException {
  const WrongCred();
}

class WrongCode extends AuthException {
  const WrongCode();
}

class NoLoginFound extends AuthException {
  const NoLoginFound();
}

class NotValidLogin extends AuthException {
  const NotValidLogin();
}
