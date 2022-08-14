import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quick_quotes_quill/all.dart';
import 'package:rest_client/rest_client.dart';

import 'app.dart';
import 'constants/app.dart' as const_app;
import 'routes.dart';
import 'scope/app_scope.dart';

void main() async {
  final manager = SpreadQuillManager(const_app.loggerManagerName);
  final quills = <Quill>[];

  if (kDebugMode) {
    final cq = ConsoleQuill(const_app.loggerName);

    cq
      ..config = cq.config.copyWith(
        msgFGColor: CQHIColors.white.fg,
      )
      ..info('Logger is enabled!');

    quills.add(cq);
  } else {
    final fq = FileQuill(
      const_app.loggerName,
      dir: await getApplicationDocumentsDirectory(),
    )..info('Logger is enabled');

    quills.add(fq);
  }

  await manager.initialize(quills);

  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );

  final router = GoRouter(
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

  runApp(
    ProviderScope(
      overrides: [
        AppScope.get().loggerManager.overrideWithValue(manager),
        AppScope.get().restClient.overrideWithValue(
              const ClientFactory().createMockClient(),
            ),
        AppScope.get().router.overrideWithValue(router),
      ],
      child: const App(),
    ),
  );
}
