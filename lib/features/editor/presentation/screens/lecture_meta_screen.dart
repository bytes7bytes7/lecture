import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rest_client/rest_client.dart';

import '../../../../constants/measures.dart' as const_measures;
import '../../../../l10n/l10n.dart';
import '../../../../scope/app_scope.dart';
import '../../../../widgets/widgets.dart';
import '../../../common/common.dart';

const _padding = EdgeInsets.symmetric(
  horizontal: const_measures.mainHorMargin,
  vertical: const_measures.mainVerMargin,
);

const _separator = SizedBox(height: 30);

class LectureMetaScreen extends ConsumerWidget {
  const LectureMetaScreen({
    super.key,
    required this.lecture,
  });

  final Lecture? lecture;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    DateTime? date;
    final dateStr = lecture?.date;
    if (dateStr != null) {
      date = DateTime.parse(dateStr);
    }

    return Scaffold(
      appBar: DefaultAppBar(
        prefix: Icons.close,
        prefixTooltip: l10n.tooltipAbortEdit,
        prefixOnPressed: () {
          showBottomOverlay(
            context: context,
            text: l10n.abortEditAskAgain,
            secondary: l10n.cancelBtn,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: _padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                l10n.lectureDate,
                style: theme.textTheme.bodyText1,
              ),
              Calendar(
                focusedDay: date,
                canSelectRange: false,
              ),
              _separator,
              SelectField(
                value: '',
                onChanged: (value) {},
                hint: l10n.institution,
                items: const [],
              ),
              SelectField(
                value: '',
                onChanged: (value) {},
                hint: l10n.subject,
                items: const [],
              ),
              SelectField(
                value: '',
                onChanged: (value) {},
                hint: l10n.fullNameOfLecturer,
                items: const [],
              ),
              _separator,
              DoubleButton(
                primary: l10n.moveNextBtn,
                primaryOnPressed: () => _openEditor(ref),
                secondary: l10n.cancelBtn,
                secondaryOnPressed: () => _abort(ref),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openEditor(WidgetRef ref) {
    ref.read(AppScope.get().loggerManager).log('open editor');
  }

  void _abort(WidgetRef ref) {
    ref.read(AppScope.get().loggerManager).log('abort editing');
  }
}
