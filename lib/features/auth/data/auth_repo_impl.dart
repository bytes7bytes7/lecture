import 'dart:async';

import 'package:common/common.dart';
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
    final error = resp.error;

    if (rLogin == login) {
      return;
    } else {
      _throwException(error);
    }
  }

  @override
  Future<void> verifyCode(String code) async {
    final resp = await _client.verifyCode(code);
    final verified = resp.verified;
    final error = resp.error;

    if (verified == true) {
      return;
    } else if (verified == false) {
      throw const AuthException.wrongCode();
    } else {
      _throwException(error);
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
    final error = resp.error;

    if (firstName == resp.firstName &&
        lastName == resp.lastName &&
        middleName == resp.middleName) {
      final me = await _client.getMe();
      _userSubject.add(me);
      // TODO: maybe I should get token here
      return;
    } else {
      _throwException(error);
    }
  }

  @override
  Future<void> signIn(String login, String password) async {
    final resp = await _client.signIn(login: login, password: password);
    final access = resp.access;
    final error = resp.error;

    if (access != null) {
      final me = await _client.getMe();
      _userSubject.add(me);
    } else {
      _throwException(error);
    }
  }

  @override
  Future<void> recover(String login) async {
    final resp = await _client.recover(login);
    final sentEmail = resp.sentEmail;
    final error = resp.error;

    if (sentEmail == true) {
      return;
    } else if (sentEmail == false) {
      throw const AuthException.noAccountFound();
    } else {
      _throwException(error);
    }
  }

  @override
  Future<void> changePassword(String password) async {
    final resp = await _client.changePassword(password);
    final access = resp.access;
    final error = resp.error;

    if (access != null) {
      final me = await _client.getMe();
      _userSubject.add(me);
    } else {
      _throwException(error);
    }
  }

  @override
  Future<void> logOut() async {
    // TODO: add _client.logOut()
    _userSubject.add(notAuthorizedUser);
  }

  void _throwException(RespError? error) {
    final details = error?.details;

    if (details != null) {
      for (final field in details.values) {
        if (field is List<String>) {
          for (final reason in field) {
            _checkReason(reason);
          }
        } else if (field is String) {
          _checkReason(field);
        }
      }
    }

    throw const AuthException.unknown();
  }

  void _checkReason(String reason) {
    if (reason == const_api.Details.loginAlreadyInUse) {
      throw const AuthException.loginAlreadyInUse();
    } else if (reason == const_api.Details.notValidLogin) {
      throw const AuthException.notValidLogin();
    } else if (reason == const_api.Details.noAccount) {
      throw const AuthException.noAccountFound();
    } else if (reason == const_api.Details.commonPassword ||
        reason == const_api.Details.numericPassword ||
        reason == const_api.Details.shortPassword) {
      throw const AuthException.invalidPassword();
    } else if (reason == const_api.Details.emptyField) {
      throw const AuthException.someFieldIsEmpty();
    } else if (reason == const_api.Details.wrongOrInvalidToken) {
      throw const AuthException.invalidOrExpiredToken();
    }
  }
}
