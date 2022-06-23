import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quick_quotes_quill/console_quill.dart';
import 'package:quick_quotes_quill/spread_quill_manager.dart';

import 'app.dart';
import 'constants/app.dart' as const_app;
import 'scope/app_scope.dart';

void main() async {
  if (kDebugMode) {
    final quill = ConsoleQuill(const_app.loggerName);
    quill
      ..config = quill.config.copyWith(
        msgFGColor: CQHIColors.gray.fg,
      )
      ..info('Logger is enabled!');

    await SpreadQuillManager.inst.initialize([
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
      child: const App(),
    ),
  );
}
