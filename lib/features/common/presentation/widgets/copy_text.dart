import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../l10n/l10n.dart';
import '../snack_bar.dart';

class CopyText extends ConsumerWidget {
  const CopyText({
    super.key,
    required this.text,
    this.style,
  });

  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    return GestureDetector(
      onTap: () {
        Clipboard.setData(
          ClipboardData(
            text: text,
          ),
        );
        showSnackBar(
          ref,
          l10n.textCopied,
        );
      },
      child: Text(
        text,
        style: style,
      ),
    );
  }
}
