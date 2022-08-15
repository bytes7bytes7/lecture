import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:common/common.dart';
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

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();

    _router = GoRouter(
      debugLogDiagnostics: kDebugMode,
      urlPathStrategy: UrlPathStrategy.path,
      initialLocation: AppRoutes.get().auth.path,
      refreshListenable: GoRouterRefreshStream(
        ref.read(AppScope.get().authRepo).user,
      ),
      redirect: (state) {
        final loggedIn = ref.read(AppScope.get().authRepo).user.value.id !=
            notAuthorizedUser.id;
        final loggingIn = state.subloc == AppRoutes.get().auth.path;

        final from = state.subloc == AppRoutes.get().home.path
            ? ''
            : AppRoutes.get().fromLoc(state.subloc);

        if (!loggedIn) {
          if (loggingIn) {
            return null;
          }

          return '${AppRoutes.get().auth.path}$from';
        }

        if (loggingIn) {
          return state.from ?? AppRoutes.get().home.path;
        }

        return null;
      },
      routes: [
        AppRoutes.get().auth,
        AppRoutes.get().home,
        AppRoutes.get().notFound,
      ],
      errorPageBuilder: AppRoutes.get().notFound.pageBuilder,
    );
  }

  @override
  void dispose() {
    _router.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
