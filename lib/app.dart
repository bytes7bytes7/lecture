import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

import 'constants/app.dart' as const_app;
import 'constants/routes.dart' as const_routes;
import 'screen_router.dart';
import 'themes/themes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
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
          navigatorKey: ScreenRouter.inst.navigatorKey,
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
