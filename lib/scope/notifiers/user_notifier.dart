import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rest_client/rest_client.dart';

class UserNotifier extends StateNotifier<User> {
  UserNotifier(
    super.state, {
    required this.onLogOut,
  });

  final VoidCallback onLogOut;

  set user(User value) => state = value;

  void logIn() {}

  void logOut() {
    onLogOut();
    state = const NotAuthorizedUser();
  }
}
