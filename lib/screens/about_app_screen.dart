import 'package:flutter/material.dart';

import '../features/common/common.dart';
import '../l10n/l10n.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: DefaultAppBar(
        prefix: Icons.arrow_back,
        prefixTooltip: l10n.tooltipBack,
        prefixOnPressed: () {
          Navigator.pop(context);
        },
        title: l10n.aboutAppTitle,
      ),
    );
  }
}
