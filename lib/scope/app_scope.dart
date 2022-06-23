import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_providers.dart';

class AppScope extends StatelessWidget with AppProviders {
  factory AppScope({
    Key? key,
    required Widget child,
  }) {
    return _inst = AppScope._(
      key: key,
      child: child,
    );
  }

  AppScope._({
    super.key,
    required this.child,
  });

  static AppScope? _inst;

  /// Root widget.
  final Widget child;

  static AppScope get() {
    final inst = _inst;
    if (inst != null) {
      return inst;
    }

    throw Exception('AppScope is not created');
  }

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: child,
    );
  }
}
