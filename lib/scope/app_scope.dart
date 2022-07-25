// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_quotes_quill/all.dart';

import 'app_providers.dart';

export 'notifiers/notifiers.dart';

class AppScope extends StatelessWidget with AppProviders {
  static AppScope? _inst;

  static AppScope get() {
    final inst = _inst;
    if (inst != null) {
      return inst;
    }

    throw Exception('AppScope is not created');
  }

  factory AppScope({
    Key? key,
    required Widget child,
    required SpreadQuillManager spreadQuillManager,
  }) {
    return _inst = AppScope._(
      key: key,
      child: child,
      spreadQuillManager: spreadQuillManager,
    );
  }

  AppScope._({
    super.key,
    required this.child,
    required this.spreadQuillManager,
  });

  /// Root widget.
  final Widget child;

  final SpreadQuillManager spreadQuillManager;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        loggerManager.overrideWithValue(spreadQuillManager),
      ],
      child: child,
    );
  }
}
