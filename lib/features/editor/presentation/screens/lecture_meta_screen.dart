import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../l10n/l10n.dart';
import '../../../../scope/app_scope.dart';
import '../../../common/common.dart';

class LectureMetaScreen extends ConsumerWidget {
  const LectureMetaScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: DefaultAppBar(
        prefix: Icons.close,
        prefixTooltip: l10n.tooltipAbortEdit,
        prefixOnPressed: () {
          showBottomOverlay(
            context: context,
            text: l10n.abortEditAskAgain,
            secondary: l10n.cancel,
            secondaryOnPressed: () {
              Navigator.pop(context);
            },
            primary: l10n.abortBtn,
            primaryOnPressed: () {
              ref.read(AppScope.get().loggerManager).log('abort edit');
            },
          );
        },
        title: l10n.editor,
      ),
    );
  }
}
