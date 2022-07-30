import 'dart:async';

import 'package:rest_client/constants.dart' as const_api;
import 'package:rest_client/rest_client.dart';

import 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  AuthRepoImpl({required RestClient client})
      : _client = client,
        _statusController = StreamController<AuthStatus>()
          ..sink.add(AuthStatus.loggedOut);

  final RestClient _client;
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
    final resp = await _client.signUp(login, password);
    final rLogin = resp[const_api.login];
    final error = resp[const_api.error];
    if (rLogin == login) {
      // TODO: maybe I should get token here
      _sink.add(AuthStatus.signUp);
    } else if (error == 'user with this phone already exists.') {
      _sink.add(AuthStatus.loginAlreadyExists);
    } else {
      _sink.add(AuthStatus.wrongCred);
    }
  }
}
