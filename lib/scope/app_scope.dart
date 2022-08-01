import 'app_providers.dart';

export 'src/export.dart';

class AppScope with AppProviders {
  factory AppScope() {
    if (_inst != null) {
      throw Exception('AppScope is already created');
    }

    return _inst = AppScope._();
  }

  AppScope._();

  static AppScope? _inst;

  static AppScope get() {
    final inst = _inst;
    if (inst != null) {
      return inst;
    }

    throw Exception('AppScope is not created');
  }
}
