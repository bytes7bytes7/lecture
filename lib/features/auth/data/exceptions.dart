class AuthException implements Exception {
  const AuthException();

  const factory AuthException.loginAlreadyExists() = LoginAlreadyInUse;

  const factory AuthException.wrongCred() = WrongCred;

  const factory AuthException.wrongCode() = WrongCode;

  const factory AuthException.noLoginFound() = NoLoginFound;

  const factory AuthException.unknown() = Unknown;
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

class Unknown extends AuthException {
  const Unknown();
}
