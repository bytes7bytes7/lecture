import 'package:flutter/material.dart';

import '../features/common/common.dart';
import '../l10n/l10n.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: DefaultAppBar(
        prefixConfig: AppBarButtonConfig(
          icon: Icons.arrow_back,
          tooltip: l10n.tooltipBack,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: l10n.accountTitle,
      ),
    );
  }
}
