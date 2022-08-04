import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/measures.dart' as const_measures;
import '../../../../constants/routes.dart' as const_routes;
import '../../../../l10n/l10n.dart';
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
        prefixOnPressed: () => _abort(ref),
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
    final context = ref.read(AppScope.get().navigatorKey).currentContext;
    if (context != null) {
      final l10n = context.l10n;

      showBottomOverlay(
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
    final context = ref.read(AppScope.get().navigatorKey).currentContext;
    if (context != null) {
      Navigator.of(context).pushNamed(const_routes.editor);
    }
  }
}
