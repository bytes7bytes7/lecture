import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'constants/app.dart' as const_app;
import 'l10n/l10n.dart';
import 'routes.dart';
import 'scope/app_scope.dart';
import 'themes/themes.dart';

class App extends ConsumerWidget {
  App({super.key});

  final _router = GoRouter(
    debugLogDiagnostics: kDebugMode,
    urlPathStrategy: UrlPathStrategy.path,
    initialLocation: AppRoutes.get().auth.path,
    routes: [
      AppRoutes.get().auth,
      AppRoutes.get().home,
      AppRoutes.get().notFound,
    ],
    errorPageBuilder: AppRoutes.get().notFound.pageBuilder,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initTheme = ref.read(AppScope.get().colorTheme);

    return AdaptiveTheme(
      light: lightTheme,
      dark: darkTheme,
      initial: initTheme,
      builder: (lightTheme, darkTheme) {
        return MaterialApp.router(
          routeInformationProvider: _router.routeInformationProvider,
          routeInformationParser: _router.routeInformationParser,
          routerDelegate: _router.routerDelegate,
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
