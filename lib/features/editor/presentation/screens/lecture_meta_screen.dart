import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/measures.dart' as const_measures;
import '../../../../l10n/l10n.dart';
import '../../../../routes.dart';
import '../../../common/common.dart';

const _padding = EdgeInsets.symmetric(
  horizontal: const_measures.mainHorMargin,
  vertical: const_measures.mainVerMargin,
);

const _separator = SizedBox(height: 30);

class LectureMetaScreen extends ConsumerWidget {
  const LectureMetaScreen({
    super.key,
    required this.lectureId,
  });

  final int? lectureId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    // TODO: make request
    final lecture = Lecture.random();

    final date = _parseDate(lecture);

    return Scaffold(
      appBar: DefaultAppBar(
        prefixConfig: AppBarButtonConfig(
          icon: Icons.close,
          tooltip: l10n.tooltipAbortEdit,
          onPressed: () => _abort(context),
        ),
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
                selectedDay: date,
                canSelectRange: false,
              ),
              _separator,
              // TODO: create lectureEdit provider and work with it
              SelectField(
                value: '',
                onChanged: (value) {},
                hint: l10n.institution,
                items: const ['1', '2'],
              ),
              SelectField(
                value: '',
                onChanged: (value) {},
                hint: l10n.subject,
                items: const ['1', '2'],
              ),
              SelectField(
                value: '',
                onChanged: (value) {},
                hint: l10n.fullNameOfLecturer,
                items: const ['1', '2'],
              ),
              _separator,
              SingleButton(
                text: l10n.moveNextBtn,
                onPressed: () => _openEditor(context, lectureId),
              ),
            ],
          ),
        ),
      ),
    );
  }

  DateTime _parseDate(Lecture lecture) {
    final lst = lecture.date.split('.');

    final day = int.parse(lst[0]);
    final month = int.parse(lst[1]);
    final year = int.parse(lst[2]);

    return DateTime(year, month, day);
  }

  void _abort(BuildContext context) {
    final l10n = context.l10n;

    showQuestionBottomOverlay(
      context: context,
      text: l10n.abortEditAskAgain,
      secondary: l10n.cancelBtn,
      secondaryOnPressed: () {
        // Use Navigator to proper pop bottom sheet
        Navigator.of(context).pop();
      },
      primary: l10n.abortBtn,
      primaryOnPressed: () {
        // Use Navigator to proper pop bottom sheet
        Navigator.of(context).pop();
        Navigator.of(context).pop();
      },
    );
  }

  void _openEditor(BuildContext context, int? lectureId) {
    EditorRoute(lid: lectureId).push(context);
  }
}
