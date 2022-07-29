import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quick_quotes_quill/all.dart';

import 'app.dart';
import 'constants/app.dart' as const_app;
import 'scope/app_scope.dart';

void main() async {
  final manager = SpreadQuillManager(const_app.loggerManagerName);

  if (kDebugMode) {
    final quill = ConsoleQuill(const_app.loggerName);

    quill
      ..config = quill.config.copyWith(
        msgFGColor: CQHIColors.white.fg,
      )
      ..info('Logger is enabled!');

    await manager.initialize([
      quill,
    ]);
  }

  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );

  runApp(
    AppScope(
      spreadQuillManager: manager,
      child: const App(),
    ),
  );
}
