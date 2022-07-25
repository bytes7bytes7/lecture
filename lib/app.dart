import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'constants/app.dart' as const_app;
import 'constants/routes.dart' as const_routes;
import 'l10n/l10n.dart';
import 'scope/app_scope.dart';
import 'screen_router.dart';
import 'themes/themes.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AdaptiveTheme(
      light: lightTheme,
      dark: darkTheme,
      initial: AdaptiveThemeMode.system,
      builder: (lightTheme, darkTheme) {
        return MaterialApp(
          title: const_app.projectName,
          theme: lightTheme,
          darkTheme: darkTheme,
          debugShowCheckedModeBanner: false,
          navigatorKey: ref.read(AppScope.get().navigatorKey),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('ru', ''),
            Locale('en', ''),
          ],
          onGenerateInitialRoutes: (_) => [
            ScreenRouter.inst.navigate(
              const RouteSettings(name: const_routes.auth),
            ),
          ],
          onGenerateRoute: ScreenRouter.inst.navigate,
        );
      },
    );
  }
}
