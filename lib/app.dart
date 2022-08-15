import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:common/common.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'constants/app.dart' as const_app;
import 'l10n/l10n.dart';
import 'router_observer.dart';
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
      initialLocation: AuthRoute().route.path,
      refreshListenable: GoRouterRefreshStream(
        ref.read(AppScope.get().authRepo).user,
      ),
      redirect: (state) {
        final loggedIn = ref.read(AppScope.get().authRepo).user.value.id !=
            notAuthorizedUser.id;
        final loggingIn = state.subloc == AuthRoute().route.path;

        final from = state.subloc == HomeRoute().route.path
            ? ''
            : CosyRoute.fromLoc(state.subloc);

        if (!loggedIn) {
          if (loggingIn) {
            return null;
          }

          return '${AuthRoute().route.path}$from';
        }

        if (loggingIn) {
          return state.from ?? HomeRoute().route.path;
        }

        return null;
      },
      routes: [
        AuthRoute().route,
        HomeRoute().route,
        NotFoundRoute().route,
      ],
      errorPageBuilder: NotFoundRoute().route.pageBuilder,
      observers: [
        NavObserver(
          ref.read(AppScope.get().loggerManager),
        ),
      ],
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
