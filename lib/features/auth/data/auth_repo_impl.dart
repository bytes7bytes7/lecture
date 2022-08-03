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
  Future<void> signUp(String login, String password) async {
    final resp = await _client.signUp(login: login, password: password);
    final rLogin = resp.login;
    final detail = resp.detail;

    if (rLogin == login) {
      _userSubject.add(
        _userSubject.value.copyWith(
          email: login,
        ),
      );
    } else {
      _throwException(detail);
    }
  }

  @override
  Future<void> verifyCode(String code) async {
    final resp = await _client.verifyCode(code);
    final verified = resp.verified;
    final detail = resp.detail;

    if (verified == true) {
      return;
    } else if (verified == false) {
      throw const AuthException.wrongCode();
    } else {
      _throwException(detail);
    }
  }

  @override
  Future<void> setPersonalInfo({
    required String firstName,
    required String lastName,
    required String? middleName,
  }) async {
    final resp = await _client.setPersonalInfo(
      firstName: firstName,
      lastName: lastName,
      middleName: middleName,
    );
    final detail = resp.detail;

    if (firstName == resp.firstName &&
        lastName == resp.lastName &&
        middleName == resp.middleName) {
      final me = await _client.getMe();
      _userSubject.add(me);
      // TODO: maybe I should get token here
      return;
    } else {
      _throwException(detail);
    }
  }

  @override
  Future<void> signIn(String login, String password) async {
    final resp = await _client.signIn(login: login, password: password);
    final access = resp.access;
    final detail = resp.detail;

    if (access != null) {
      _userSubject.add(
        _userSubject.value.copyWith(
          email: login,
        ),
      );
    } else {
      _throwException(detail);
    }
  }

  @override
  Future<void> recover(String login) async {
    final resp = await _client.recover(login);
    final sentEmail = resp.sentEmail;
    final detail = resp.detail;

    if (sentEmail == true) {
      return;
    } else if (sentEmail == false) {
      throw const AuthException.noLoginFound();
    } else {
      _throwException(detail);
    }
  }

  @override
  Future<void> changePassword(String password) async {
    final resp = await _client.changePassword(password);
    final access = resp.access;
    final detail = resp.detail;

    if (access != null) {
      final me = await _client.getMe();
      _userSubject.add(me);
    } else {
      _throwException(detail);
    }
  }

  @override
  Future<void> logOut() async {
    // TODO: add _client.logOut()
    _userSubject.add(notAuthorizedUser);
  }

  void _throwException(Object? detail) {
    if (detail == const_api.loginAlreadyInUse) {
      throw const AuthException.loginAlreadyInUse();
    } else if (detail == const_api.notValidLogin) {
      throw const AuthException.notValidLogin();
    } else if (detail == const_api.noAccount) {
      throw const AuthException.noLoginFound();
    } else {
      throw const AuthException.unknown();
    }
  }
}
