import 'package:flutter/material.dart';
import 'package:quick_quotes_quill/spread_quill_manager.dart';

import '../widgets/default_app_bar.dart';
import '../widgets/single_button.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SpreadQuillManager.inst.error('Открыт 404 экран');

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
