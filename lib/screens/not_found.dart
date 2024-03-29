import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/common/common.dart';
import '../l10n/l10n.dart';
import '../routes.dart';
import '../scope/app_scope.dart';

class NotFoundScreen extends ConsumerWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(AppScope.get().loggerManager).error('Открыт 404 экран');

    final theme = Theme.of(context);
    final l10n = context.l10n;

    return Scaffold(
      appBar: DefaultAppBar(
        prefixConfig: AppBarButtonConfig(
          icon: Icons.arrow_back,
          tooltip: l10n.tooltipBack,
          onPressed: () => _goToSafePlace(context),
        ),
        title: l10n.notFoundTitle,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              l10n.notFoundBody,
              style: theme.textTheme.bodyText2,
            ),
            const Spacer(),
            SingleButton(
              text: l10n.goBack,
              onPressed: () => _goToSafePlace(context),
            ),
          ],
        ),
      ),
    );
  }

  void _goToSafePlace(BuildContext context) {
    if (context.canPop()) {
      Navigator.of(context).pop();
    } else {
      HomeRoute().go(context);
    }
  }
}
