import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/auth_repo.dart';

class AuthController extends StateNotifier<AsyncValue<AuthState>> {
  AuthController({
    required AuthRepo authRepo,
  })  : _authRepo = authRepo,
        super(const AsyncData(AuthState.loggedOut));

  final AuthRepo _authRepo;

  Future<void> signUp(String login, String password) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _authRepo.signUp(login, password),
    );
  }

  Future<void> verifyCode(String code) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _authRepo.verifyCode(code),
    );
  }

  Future<void> setPersonalInfo({
    required String firstName,
    required String lastName,
    required String? middleName,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _authRepo.setPersonalInfo(
        firstName: firstName,
        lastName: lastName,
        middleName: middleName,
      ),
    );
  }
}
