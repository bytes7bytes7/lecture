import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features.dart';
import '../data/auth_repo.dart';

enum AuthState {
  cancelRecovery,
  cancelVerification,
  loggedIn,
  loggedOut,
  openRecover,
  openLogIn,
  openRegister,
  requestedRecover,
  registered,
  verifiedRecover,
  verifiedRegister,
}

enum AuthFlow {
  register,
  recover,
}

class AuthController extends StateNotifier<AsyncValue<AuthState>> {
  AuthController({
    required AuthRepo authRepo,
  })  : _authRepo = authRepo,
        _flow = AuthFlow.register,
        super(
          const AsyncData(AuthState.loggedOut),
        );

  final AuthRepo _authRepo;
  AuthFlow _flow;

  Future<void> openRegister() async {
    state = const AsyncData(AuthState.openRegister);
  }

  Future<void> openLogIn() async {
    state = const AsyncData(AuthState.openLogIn);
  }

  Future<void> openRecover() async {
    state = const AsyncData(AuthState.openRecover);
  }

  Future<void> cancelVerification() async {
    state = const AsyncData(AuthState.cancelVerification);
  }

  Future<void> register(String login, String password) async {
    _flow = AuthFlow.register;
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _authRepo.register(login, password).then((_) => AuthState.registered),
    );
  }

  Future<void> verifyCode(String code) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _authRepo.verifyCode(code).then((value) {
        if (_flow == AuthFlow.register) {
          return AuthState.verifiedRegister;
        }

        return AuthState.verifiedRecover;
      }),
    );
  }

  Future<void> setPersonalInfo({
    required String firstName,
    required String lastName,
    required String? middleName,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _authRepo
          .setPersonalInfo(
            firstName: firstName,
            lastName: lastName,
            middleName: middleName,
          )
          .then((_) => AuthState.loggedIn),
    );
  }

  Future<void> logIn(String login, String password) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _authRepo.logIn(login, password).then((_) => AuthState.loggedIn),
    );
  }

  Future<void> recover(String login) async {
    _flow = AuthFlow.recover;
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _authRepo.recover(login).then((_) => AuthState.requestedRecover),
    );
  }

  Future<void> cancelRecovery() async {
    state = const AsyncData(AuthState.cancelRecovery);
  }

  Future<void> changePassword(String password) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _authRepo.changePassword(password).then((_) => AuthState.loggedIn),
    );
  }
}
