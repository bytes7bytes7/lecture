import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../scope/app_scope.dart';

void showSnackBar({required WidgetRef ref, required String text}) {
    final context = ref.read(AppScope.get().router).navigator?.context;
  if (context != null) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text,
        ),
      ),
    );
  }
}
