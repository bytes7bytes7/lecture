class AuthException implements Exception {
  const AuthException();

  const factory AuthException.unknown() = Unknown;

  const factory AuthException.loginAlreadyInUse() = LoginAlreadyInUse;

  const factory AuthException.wrongCred() = WrongCred;

  const factory AuthException.wrongCode() = WrongCode;

  const factory AuthException.noAccountFound() = NoAccountFound;

  const factory AuthException.notValidLogin() = NotValidLogin;

  const factory AuthException.invalidPassword() = InvalidPassword;

  const factory AuthException.someFieldIsEmpty() = SomeFieldIsEmpty;

  const factory AuthException.invalidOrExpiredToken() = InvalidOrExpiredToken;
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

class NoAccountFound extends AuthException {
  const NoAccountFound();
}

class NotValidLogin extends AuthException {
  const NotValidLogin();
}

class InvalidPassword extends AuthException {
  const InvalidPassword();
}

class SomeFieldIsEmpty extends AuthException {
  const SomeFieldIsEmpty();
}

class InvalidOrExpiredToken extends AuthException {
  const InvalidOrExpiredToken();
}
