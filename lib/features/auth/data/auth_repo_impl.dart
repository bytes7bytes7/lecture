import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rest_client/constants.dart' as const_api;
import 'package:rest_client/rest_client.dart';

import '../../../scope/src/user_notifier.dart';
import 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  AuthRepoImpl({
    required Ref ref,
    required StateNotifierProvider<UserNotifier, User> user,
    required RestClient client,
  })  : _ref = ref,
        _user = user,
        _client = client,
        _statusController = StreamController<AuthStatus>()
          ..sink.add(AuthStatus.loggedOut);

  final Ref _ref;
  final RestClient _client;
  final StateNotifierProvider<UserNotifier, User> _user;
  final StreamController<AuthStatus> _statusController;

  Sink<AuthStatus> get _sink => _statusController.sink;

  @override
  Stream<AuthStatus> get status => _statusController.stream;

  @override
  void dispose() {
    _statusController.close();
  }

  @override
  Future<void> signUp(String login, String password) async {
    final resp = await _client.signUp(login: login, password: password);
    final rLogin = resp[const_api.login];
    final error = resp[const_api.error];
    if (rLogin == login) {
      final u = _ref.read(_user);
      _ref.read(_user.notifier).newState = u.copyWith(email: login);
      _sink.add(AuthStatus.signUp);
    } else if (error == 'user with this phone already exists.') {
      _sink.add(AuthStatus.loginAlreadyExists);
    } else {
      _sink.add(AuthStatus.wrongCred);
    }
  }

  @override
  Future<void> verifyCode(String code) async {
    final resp = await _client.verifyCode(code);
    final verified = resp[const_api.verified];
    if (verified == true) {
      // TODO: maybe I should get token here
      _sink.add(AuthStatus.verifiedSignUp);
    } else {
      _sink.add(AuthStatus.wrongCode);
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

    if (firstName == resp[const_api.firstName] &&
        lastName == resp[const_api.lastName] &&
        middleName == resp[const_api.middleName]) {
      final me = await _client.getMe();
      _ref.read(_user.notifier).newState = me;

      _sink.add(AuthStatus.loggedIn);
    } else {
      _sink.add(AuthStatus.unknown);
    }
  }

  @override
  Future<void> logOut() async {
    _ref.read(_user.notifier).newState = notAuthorizedUser;
    // TODO: add _client.logOut()
  }
}
