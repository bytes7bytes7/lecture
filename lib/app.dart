import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'constants/app.dart' as const_app;
import 'l10n/l10n.dart';
import 'scope/app_scope.dart';
import 'themes/themes.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initTheme = ref.read(AppScope.get().colorTheme);
    final router = ref.read(AppScope.get().router);

    return AdaptiveTheme(
      light: lightTheme,
      dark: darkTheme,
      initial: initTheme,
      builder: (lightTheme, darkTheme) {
        return MaterialApp.router(
          routeInformationProvider: router.routeInformationProvider,
          routeInformationParser: router.routeInformationParser,
          routerDelegate: router.routerDelegate,
          title: const_app.projectName,
          theme: lightTheme,
          darkTheme: darkTheme,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const_app.supportedLocales,
        );
      },
    );
  }
}
