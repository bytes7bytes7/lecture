import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/app.dart' as const_app;
import '../constants/colors.dart' as const_colors;
import '../overlays/overlays.dart';
import '../scope/app_scope.dart';
import '../widgets/widgets.dart';

const _logoSeparator = SizedBox(width: 5);
const _mainFlex = 5;

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;
    final height = size.height - padding.top - padding.bottom;

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).primaryColor,
      ),
    );

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
                              height: theme.textTheme.headline1?.fontSize,
                              width: theme.textTheme.headline1?.fontSize,
                              child: Image.asset(const_app.logo96),
                            ),
                            _logoSeparator,
                            Text(
                              const_app.appName,
                              style: theme.textTheme.headline1?.copyWith(
                                color: const_colors.white,
                              ),
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
                                  notifier: AppScope.get().showConfirmOverlay,
                                  overlay: const ConfirmOverlay(),
                                ),
                                ListeningOverlay(
                                  notifier:
                                      AppScope.get().showPersonalInfoOverlay,
                                  overlay: const PersonalInfoOverlay(),
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
}
