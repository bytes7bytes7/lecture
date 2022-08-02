import 'package:freezed_annotation/freezed_annotation.dart';

part 'exceptions.freezed.dart';

@freezed
class AuthException with _$AuthException implements Exception {
  const factory AuthException.loginAlreadyExists() = LoginAlreadyInUse;

  const factory AuthException.wrongCred() = WrongCred;

  const factory AuthException.wrongCode() = WrongCode;

  const factory AuthException.noLoginFound() = NoLoginFound;

  const factory AuthException.unknown() = Unknown;
}
