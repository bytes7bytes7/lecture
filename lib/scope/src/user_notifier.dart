import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rest_client/rest_client.dart';

class UserNotifier extends StateNotifier<User> {
  UserNotifier(
    super.state, {
    required VoidCallback onLogOut,
  }) : _onLogOut = onLogOut;

  final VoidCallback _onLogOut;

  set user(User value) => state = value;

  void refreshToken(String token) {
    state = state.copyWith(token: token);
  }

  void logOut() {
    _onLogOut();
    state = notAuthorizedUser;
  }
}
