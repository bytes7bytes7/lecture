import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../scope/app_scope.dart';
import '../widgets/default_app_bar.dart';
import '../widgets/single_button.dart';

class NotFoundScreen extends ConsumerWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(AppScope.get().loggerManager).error('Открыт 404 экран');

    final theme = Theme.of(context);

    return Scaffold(
      appBar: const DefaultAppBar(
        title: 'Туда, не знаю куда',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              'Где это мы? 😳',
              style: theme.textTheme.subtitle1,
            ),
            const Spacer(),
            SingleButton(
              text: 'Назад',
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
