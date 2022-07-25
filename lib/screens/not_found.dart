import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../l10n/l10n.dart';
import '../scope/app_scope.dart';
import '../widgets/default_app_bar.dart';
import '../widgets/single_button.dart';

class NotFoundScreen extends ConsumerWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(AppScope.get().loggerManager).error('Открыт 404 экран');

    final theme = Theme.of(context);
    final l10n = context.l10n;

    return Scaffold(
      appBar: DefaultAppBar(
        title: l10n.notFoundTitle,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              l10n.notFoundBody,
              style: theme.textTheme.subtitle2,
            ),
            const Spacer(),
            SingleButton(
              text: l10n.goBack,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
