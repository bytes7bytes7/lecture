import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app.dart' as const_app;
import '../../../../l10n/l10n.dart';
import '../../../../scope/app_scope.dart';
import '../../data/auth_repo.dart';
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
    final l10n = context.l10n;
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;
    final height = size.height - padding.top - padding.bottom;

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).primaryColor,
      ),
    );

    _onData(context, ref, l10n);

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        // to show background color when keyboard is closing
        backgroundColor: theme.scaffoldBackgroundColor,
        body: SafeArea(
          child: ColoredBox(
            color: theme.primaryColor,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
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
                                  notifier: AppScope.get().showSignInOverlay,
                                  overlay: const SignInOverlay(),
                                ),
                                ListeningOverlay(
                                  notifier: AppScope.get().showRecoveryOverlay,
                                  overlay: const RecoveryOverlay(),
                                ),
                                ListeningOverlay(
                                  notifier: AppScope.get().showVerifyOverlay,
                                  overlay: const VerifyOverlay(),
                                ),
                                ListeningOverlay(
                                  notifier:
                                      AppScope.get().showPersonalInfoOverlay,
                                  overlay: const PersonalInfoOverlay(),
                                ),
                                ListeningOverlay(
                                  notifier:
                                      AppScope.get().showChangePasswdOverlay,
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
    );
  }

  void _onData(BuildContext context, WidgetRef ref, AppLocalizations l10n) {
    ref.listen<AsyncValue<AuthStatus>>(AppScope.get().signUpController,
        (prev, next) {
      final data = next.asData?.value;
      if (data != null) {
        switch (data) {
          case AuthStatus.signUp:
            ref.read(AppScope.get().showVerifyOverlay.notifier).state = true;
            break;
          case AuthStatus.verifiedSignUp:
            ref.read(AppScope.get().showPersonalInfoOverlay.notifier).state =
                true;
            break;
          case AuthStatus.verifiedRecover:
            ref.read(AppScope.get().showChangePasswdOverlay.notifier).state =
                true;
            break;
          default:
        }

        final info = data.toStr(l10n);
        if (info.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(info),
            ),
          );
        }
      }
    });
  }
}
