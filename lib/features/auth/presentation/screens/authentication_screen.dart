import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app.dart' as const_app;
import '../../../../scope/app_scope.dart';
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
                                        (value) => value.showSignIn,
                                      ),
                                    ),
                                    overlay: const SignInOverlay(),
                                  ),
                                  ListeningOverlay(
                                    isOpen: ref.watch(
                                      authConfig.select(
                                        (value) => value.showRecovery,
                                      ),
                                    ),
                                    overlay: const RecoveryOverlay(),
                                  ),
                                  ListeningOverlay(
                                    isOpen: ref.watch(
                                      authConfig.select(
                                        (value) => value.showVerify,
                                      ),
                                    ),
                                    overlay: const VerifyOverlay(),
                                  ),
                                  ListeningOverlay(
                                    isOpen: ref.watch(
                                      authConfig.select(
                                        (value) => value.showPersonalInfo,
                                      ),
                                    ),
                                    overlay: const PersonalInfoOverlay(),
                                  ),
                                  ListeningOverlay(
                                    isOpen: ref.watch(
                                      authConfig.select(
                                        (value) => value.showChangePasswd,
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
}
