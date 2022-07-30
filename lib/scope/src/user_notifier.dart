import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rest_client/rest_client.dart';

class UserNotifier extends StateNotifier<User> {
  UserNotifier(
    super.state, {
    required RestClient client,
    required VoidCallback onLogOut,
  })  : _client = client,
        _onLogOut = onLogOut;

  final RestClient _client;
  final VoidCallback _onLogOut;

  set user(User value) => state = value;

  void refreshToken(String token) {
    state = state.copyWith(token: token);
  }

  Future<void> logOut() async {
    _onLogOut();
    await _client.logOut();
    state = notAuthorizedUser;
  }

// TODO: place all auth logic here
}
