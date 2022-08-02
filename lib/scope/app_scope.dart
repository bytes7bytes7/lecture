import 'app_providers.dart';

export 'src/export.dart';

/// Storage for all app's providers.
class AppScope with AppProviders {
  AppScope._();

  static AppScope? _inst;

  static AppScope get() {
    final inst = _inst;
    if (inst != null) {
      return inst;
    }

    return _inst = AppScope._();
  }
}
