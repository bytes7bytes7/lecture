import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/routes.dart' as const_routes;
import '../../../l10n/l10n.dart';
import '../data/auth_repo.dart';
import 'auth_overlay_notifier.dart';

class AuthController extends StateNotifier<AsyncValue<AuthStatus>> {
  AuthController({
    required Ref ref,
    required AuthRepo authRepo,
    required Provider<GlobalKey<NavigatorState>> navigatorKey,
    required StateNotifierProvider<AuthOverlayNotifier, AuthOverlayConfig>
        authOverlayConfig,
  })  : _authOverlayConfig = authOverlayConfig,
        _ref = ref,
        _navigatorKey = navigatorKey,
        _authRepo = authRepo,
        super(const AsyncData(AuthStatus.loggedOut)) {
    _statusSub = authRepo.status.listen((event) {
      state = AsyncData(event);
    });
    _onData();
  }

  final Ref _ref;
  final Provider<GlobalKey<NavigatorState>> _navigatorKey;
  final AuthRepo _authRepo;
  final StateNotifierProvider<AuthOverlayNotifier, AuthOverlayConfig>
      _authOverlayConfig;
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

  Future<void> setPersonalInfo({
    required String firstName,
    required String lastName,
    required String? middleName,
  }) async {
    state = const AsyncLoading();
    await AsyncValue.guard(
      () => _authRepo.setPersonalInfo(
        firstName: firstName,
        lastName: lastName,
        middleName: middleName,
      ),
    );
  }

  void _onData() {
    stream.listen((event) {
      final data = event.asData?.value;
      if (data != null) {
        switch (data) {
          case AuthStatus.loggedOut:
            final context = _ref.read(_navigatorKey).currentContext;
            if (context != null) {
              _goAuth(context);
            }
            break;
          case AuthStatus.loggedIn:
            final context = _ref.read(_navigatorKey).currentContext;
            if (context != null) {
              _goHome(context);
            }
            break;
          case AuthStatus.signUp:
            final authConfig = _ref.read(_authOverlayConfig);
            _ref.read(_authOverlayConfig.notifier).newState =
                authConfig.copyWith(
              showVerify: true,
            );
            break;
          case AuthStatus.verifiedSignUp:
            final authConfig = _ref.read(_authOverlayConfig);
            _ref.read(_authOverlayConfig.notifier).newState =
                authConfig.copyWith(
              showPersonalInfo: true,
            );
            break;
          case AuthStatus.verifiedRecover:
            final authConfig = _ref.read(_authOverlayConfig);
            _ref.read(_authOverlayConfig.notifier).newState =
                authConfig.copyWith(
              showChangePasswd: true,
            );
            break;
          default:
        }

        final context = _ref.read(_navigatorKey).currentContext;
        if (context != null) {
          final l10n = context.l10n;
          final info = data.toStr(l10n);
          if (info.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(info),
              ),
            );
          }
        }
      }
    });
  }

  void _goHome(BuildContext context) {
    Navigator.of(context).popUntil((route) => route.isFirst);
    Navigator.of(context).pushReplacementNamed(const_routes.home);
  }

  void _goAuth(BuildContext context) {
    Navigator.of(context).popUntil((route) => route.isFirst);
    Navigator.of(context).pushReplacementNamed(const_routes.auth);
  }
}
