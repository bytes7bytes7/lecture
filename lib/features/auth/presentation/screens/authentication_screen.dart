import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app.dart' as const_app;
import '../../../../constants/routes.dart' as const_routes;
import '../../../../l10n/l10n.dart';
import '../../../../scope/app_scope.dart';
import '../../../common/common.dart';
import '../../data/data.dart';
import '../auth_controller.dart';
import '../overlays/overlays.dart';
import '../widgets/widgets.dart';

const _logoSeparator = SizedBox(width: 5);
const _mainFlex = 5;

class AuthenticationScreen extends ConsumerWidget {
  const AuthenticationScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;
    final height = size.height - padding.top - padding.bottom;
    final authConfig = AppScope.get().authOverlayConfig;

    ref.listen<AsyncValue<AuthState>>(
      AppScope.get().authController,
      (prev, next) => _onData(prev, next, ref),
    );

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        height: double.infinity,
        width: double.infinity,
        color: theme.errorColor,
        child: Scaffold(
          backgroundColor: theme.primaryColor,
          body: SafeArea(
            child: ColoredBox(
              color: theme.primaryColor,
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: SizedBox(
                  height: height,
                  child: Column(
                    children: [
                      Flexible(
                        child: Align(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: theme.textTheme.headline4?.fontSize,
                                width: theme.textTheme.headline4?.fontSize,
                                child: Image.asset(const_app.logo96),
                              ),
                              _logoSeparator,
                              Text(
                                const_app.appName,
                                style: theme.textTheme.headline3,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: _mainFlex,
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            return ConstraintInherited(
                              constraints: constraints,
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  const SignUpOverlay(),
                                  ListeningOverlay(
                                    isOpen: ref.watch(
                                      authConfig.select(
                                        (value) => value.openSignIn,
                                      ),
                                    ),
                                    overlay: const SignInOverlay(),
                                  ),
                                  ListeningOverlay(
                                    isOpen: ref.watch(
                                      authConfig.select(
                                        (value) => value.openRecovery,
                                      ),
                                    ),
                                    overlay: const RecoveryOverlay(),
                                  ),
                                  ListeningOverlay(
                                    isOpen: ref.watch(
                                      authConfig.select(
                                        (value) => value.openVerify,
                                      ),
                                    ),
                                    overlay: const VerifyOverlay(),
                                  ),
                                  ListeningOverlay(
                                    isOpen: ref.watch(
                                      authConfig.select(
                                        (value) => value.openPersonalInfo,
                                      ),
                                    ),
                                    overlay: const PersonalInfoOverlay(),
                                  ),
                                  ListeningOverlay(
                                    isOpen: ref.watch(
                                      authConfig.select(
                                        (value) => value.openChangePasswd,
                                      ),
                                    ),
                                    overlay: const ChangePasswordOverlay(),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onData(
    AsyncValue<AuthState>? prev,
    AsyncValue<AuthState> next,
    WidgetRef ref,
  ) {
    final data = next.asData?.value;
    if (data != null) {
      final authConfig = ref.read(AppScope.get().authOverlayConfig);
      final overlayNotifier =
          ref.read(AppScope.get().authOverlayConfig.notifier);
      switch (data) {
        case AuthState.cancelRecovery:
          overlayNotifier.newState = authConfig.copyWith(
            openRecovery: false,
          );
          break;
        case AuthState.cancelVerification:
          overlayNotifier.newState = authConfig.copyWith(
            openVerify: false,
          );
          break;
        case AuthState.loggedIn:
          final context = ref.read(AppScope.get().navigatorKey).currentContext;
          if (context != null) {
            final l10n = context.l10n;
            showSnackBar(
              ref,
              l10n.loggedInSuccess(
                ref.read(AppScope.get().authRepo).user.value.email ?? '?',
              ),
            );
          }
          _goHome(ref);
          break;
        case AuthState.loggedOut:
          _goAuth(ref);
          break;
        case AuthState.openRecover:
          overlayNotifier.newState = authConfig.copyWith(
            openRecovery: true,
          );
          break;
        case AuthState.openSignIn:
          overlayNotifier.newState = authConfig.copyWith(
            openSignIn: true,
          );
          break;
        case AuthState.openSignUp:
          overlayNotifier.newState = authConfig.copyWith(
            openSignIn: false,
          );
          break;
        case AuthState.requestedRecover:
          overlayNotifier.newState = authConfig.copyWith(
            openVerify: true,
          );
          break;
        case AuthState.signedUp:
          overlayNotifier.newState = authConfig.copyWith(
            openVerify: true,
          );
          break;
        case AuthState.verifiedRecover:
          overlayNotifier.newState = authConfig.copyWith(
            openChangePasswd: true,
          );
          break;
        case AuthState.verifiedSignUp:
          overlayNotifier.newState = authConfig.copyWith(
            openPersonalInfo: true,
          );
          break;
        default:
      }
    }

    if (next is AsyncError<AuthState>) {
      final context = ref.read(AppScope.get().navigatorKey).currentContext;
      if (context != null) {
        final l10n = context.l10n;
        final info = _getReason(next.error, l10n);
        if (info.isNotEmpty) {
          showSnackBar(ref, info);
        }
      }
    }
  }

  void _goHome(WidgetRef ref) {
    final context = ref.read(AppScope.get().navigatorKey).currentContext;
    if (context != null) {
      Navigator.of(context).popUntil((route) => route.isFirst);
      Navigator.of(context).pushReplacementNamed(const_routes.home);
    }
  }

  void _goAuth(WidgetRef ref) {
    final context = ref.read(AppScope.get().navigatorKey).currentContext;
    if (context != null) {
      Navigator.of(context).popUntil((route) => route.isFirst);
      Navigator.of(context).pushReplacementNamed(const_routes.auth);
    }
  }

  String _getReason(Object error, AppLocalizations l10n) {
    switch (error.runtimeType) {
      case WrongCred:
        return l10n.wrongLoginOrPasswd;
      case NoLoginFound:
        return l10n.noLoginFound;
      case LoginAlreadyInUse:
        return l10n.loginAlreadyExists;
      case WrongCode:
        return l10n.wrongCode;
      default:
        return l10n.unknownError;
    }
  }
}
