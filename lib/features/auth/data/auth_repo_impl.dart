import 'dart:async';

import 'package:rest_client/constants.dart' as const_api;
import 'package:rest_client/rest_client.dart';
import 'package:rxdart/rxdart.dart';

import 'auth_repo.dart';
import 'exceptions.dart';

/// Repo that manage current user, return auth overlay state.
class AuthRepoImpl implements AuthRepo {
  AuthRepoImpl({
    required RestClient client,
  })  : _client = client,
        _userSubject = BehaviorSubject()..add(notAuthorizedUser);

  final RestClient _client;
  final BehaviorSubject<User> _userSubject;

  @override
  ValueStream<User> get user => _userSubject.stream;

  @override
  void dispose() {
    _userSubject.close();
  }

  @override
  Future<AuthState> signUp(String login, String password) async {
    final resp = await _client.signUp(login: login, password: password);
    final rLogin = resp[const_api.login];
    final detail = resp[const_api.detail];
    if (rLogin == login) {
      _userSubject.add(
        _userSubject.value.copyWith(
          email: login,
        ),
      );

      return AuthState.signedUp;
    } else if (detail == const_api.userAlreadyExists) {
      throw const AuthException.loginAlreadyExists();
    } else {
      throw const AuthException.wrongCred();
    }
  }

  @override
  Future<AuthState> verifyCode(String code) async {
    final resp = await _client.verifyCode(code);
    final verified = resp[const_api.verified];
    if (verified == true) {
      return AuthState.verifiedSignUp;
    } else {
      throw const AuthException.wrongCode();
    }
  }

  @override
  Future<AuthState> setPersonalInfo({
    required String firstName,
    required String lastName,
    required String? middleName,
  }) async {
    final resp = await _client.setPersonalInfo(
      firstName: firstName,
      lastName: lastName,
      middleName: middleName,
    );

    if (firstName == resp[const_api.firstName] &&
        lastName == resp[const_api.lastName] &&
        middleName == resp[const_api.middleName]) {
      final me = await _client.getMe();
      _userSubject.add(me);
      // TODO: maybe I should get token here
      return AuthState.loggedIn;
    } else {
      throw const AuthException.loginAlreadyExists();
    }
  }

  @override
  Future<AuthState> signIn(String login, String password) async {
    final resp = await _client.signIn(login: login, password: password);
    final access = resp[const_api.access];
    final detail = resp[const_api.detail];
    if (access != null) {
      _userSubject.add(
        _userSubject.value.copyWith(
          email: login,
        ),
      );

      return AuthState.loggedIn;
    } else if (detail == const_api.noAccount) {
      throw const AuthException.wrongCred();
    } else {
      throw const AuthException.unknown();
    }
  }

  @override
  Future<AuthState> logOut() async {
    // TODO: add _client.logOut()
    _userSubject.add(notAuthorizedUser);
    return AuthState.openSignUp;
  }
}
