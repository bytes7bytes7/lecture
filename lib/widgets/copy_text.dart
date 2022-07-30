import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../l10n/l10n.dart';

class CopyText extends StatelessWidget {
  const CopyText({
    super.key,
    required this.text,
    this.style,
  });

  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return GestureDetector(
      onTap: () {
        Clipboard.setData(
          ClipboardData(
            text: text,
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              l10n.textCopied,
            ),
          ),
        );
      },
      child: Text(
        text,
        style: style,
      ),
    );
  }
}
