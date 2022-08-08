import 'package:flutter/material.dart';

import '../features/common/common.dart';
import '../l10n/l10n.dart';

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
    final l10n = context.l10n;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        topWidget ?? const SizedBox.shrink(),
        Text(
          l10n.error,
          style: theme.textTheme.bodyText2,
          textAlign: TextAlign.center,
        ),
        SingleButton(
          text: l10n.tryAgain,
          onPressed: tryAgain,
        ),
      ],
    );
  }
}
