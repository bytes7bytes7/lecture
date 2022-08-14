import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/measures.dart' as const_measures;
import '../../../../l10n/l10n.dart';
import '../../../../routes.dart';
import '../../../../scope/app_scope.dart';
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
    DateTime? date;
    if (lectureId != null) {
      date = DateTime.parse(Lecture.random().date);
    }

    return Scaffold(
      appBar: DefaultAppBar(
        prefixConfig: AppBarButtonConfig(
          icon: Icons.close,
          tooltip: l10n.tooltipAbortEdit,
          onPressed: () => _abort(ref),
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
                focusedDay: date,
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
                onPressed: () => _openEditor(ref),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _abort(WidgetRef ref) {
    final context = ref.read(AppScope.get().router).navigator?.context;
    if (context != null) {
      final l10n = context.l10n;

      showQuestionBottomOverlay(
        context: context,
        text: l10n.abortEditAskAgain,
        secondary: l10n.cancelBtn,
        secondaryOnPressed: () {
          Navigator.pop(context);
        },
        primary: l10n.abortBtn,
        primaryOnPressed: () {
          Navigator.of(context).pop();
          ref.read(AppScope.get().loggerManager).log('abort editing');
          Navigator.of(context).pop();
        },
      );
    }
  }

  void _openEditor(WidgetRef ref) {
    ref.read(AppScope.get().loggerManager).log('open editor');
    final context = ref.read(AppScope.get().router).navigator?.context;
    if (context != null) {
      context.goNamed(AppRoutes.get().editor.title);
    }
  }
}
