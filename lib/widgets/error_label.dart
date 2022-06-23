import 'package:flutter/material.dart';

import 'single_button.dart';

class ErrorLabel extends StatelessWidget {
  const ErrorLabel({
    super.key,
    required this.tryAgain,
    this.topWidget,
  });

  final VoidCallback tryAgain;
  final Widget? topWidget;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        topWidget ?? const SizedBox.shrink(),
        Text(
          'Ошибка\n👉🏻👈🏻',
          style: theme.textTheme.subtitle1,
          textAlign: TextAlign.center,
        ),
        SingleButton(
          text: 'Повторить',
          onPressed: tryAgain,
        ),
      ],
    );
  }
}
