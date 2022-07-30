import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/auth_repo.dart';

class SignUpController extends StateNotifier<AsyncValue<AuthStatus>> {
  SignUpController({
    required AuthRepo authRepo,
  })  : _authRepo = authRepo,
        super(const AsyncData(AuthStatus.loggedOut)) {
    _statusSub = authRepo.status.listen((event) {
      state = AsyncData(event);
    });
  }

  final AuthRepo _authRepo;
  late final StreamSubscription _statusSub;

  @override
  void dispose() {
    _statusSub.cancel();

    super.dispose();
  }

  Future<void> signUp(String login, String password) async {
    state = const AsyncLoading();
    await AsyncValue.guard(
      () => _authRepo.signUp(login, password),
    );
  }

  Future<void> verifyCode(String code) async {
    state = const AsyncLoading();
    await AsyncValue.guard(
      () => _authRepo.verifyCode(code),
    );
  }
}
