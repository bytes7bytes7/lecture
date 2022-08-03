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
  openSignIn,
  openSignUp,
  requestedRecover,
  signedUp,
  verifiedRecover,
  verifiedSignUp,
}

enum AuthFlow {
  signUp,
  recover,
}

class AuthController extends StateNotifier<AsyncValue<AuthState>> {
  AuthController({
    required AuthRepo authRepo,
  })  : _authRepo = authRepo,
        _flow = AuthFlow.signUp,
        super(
          const AsyncData(AuthState.loggedOut),
        );

  final AuthRepo _authRepo;
  AuthFlow _flow;

  Future<void> openSignUp() async {
    state = const AsyncData(AuthState.openSignUp);
  }

  Future<void> openSignIn() async {
    state = const AsyncData(AuthState.openSignIn);
  }

  Future<void> openRecover() async {
    state = const AsyncData(AuthState.openRecover);
  }

  Future<void> cancelVerification() async {
    state = const AsyncData(AuthState.cancelVerification);
  }

  Future<void> signUp(String login, String password) async {
    _flow = AuthFlow.signUp;
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _authRepo.signUp(login, password).then((_) => AuthState.signedUp),
    );
  }

  Future<void> verifyCode(String code) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _authRepo.verifyCode(code).then((value) {
        if (_flow == AuthFlow.signUp) {
          return AuthState.verifiedSignUp;
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

  Future<void> signIn(String login, String password) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _authRepo.signIn(login, password).then((_) => AuthState.loggedIn),
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
