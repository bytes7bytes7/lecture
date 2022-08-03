import 'package:flutter/material.dart';

import '../../../../l10n/l10n.dart';
import '../../../common/common.dart';

class LectureMetaScreen extends StatelessWidget {
  const LectureMetaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: DefaultAppBar(
        title: l10n.editor,
      ),
    );
  }
}
