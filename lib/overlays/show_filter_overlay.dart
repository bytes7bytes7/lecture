import 'package:flutter/material.dart';

import '../constants/app.dart' as const_app;
import '../constants/measures.dart' as const_measures;
import '../global_parameters.dart';
import '../widgets/widgets.dart';

const _heightFactor = 0.7;

void showFilterOverlay({
  required BuildContext context,
}) {
  final theme = Theme.of(context);

  showModalBottomSheet<void>(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (BuildContext context) {
      // TODO: find way to dynamically change size
      return FractionallySizedBox(
        heightFactor: _heightFactor,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: theme.scaffoldBackgroundColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(const_measures.overlayBorderRadius),
              topRight: Radius.circular(const_measures.overlayBorderRadius),
            ),
          ),
          child: Center(
            child: Column(
              children: [
                const DragContainer(),
                const Spacer(),
                SelectField(
                  notifier: GlobalParameters.facultyNotifier,
                  defaultText: 'Факультет',
                  items: GlobalParameters.faculties,
                ),
                SelectField(
                  notifier: GlobalParameters.levelNotifier,
                  defaultText: 'Уровень высшего образования',
                  items: GlobalParameters.levels,
                ),
                SelectField(
                  notifier: GlobalParameters.subjectNotifier,
                  defaultText: 'Предмет',
                  items: GlobalParameters.subjects,
                ),
                SelectNumberField(
                  title: 'Семестр',
                  notifier: GlobalParameters.semesterNotifier,
                  defaultText: const_app.notSetNumber,
                  min: const_app.minSemester,
                  max: GlobalParameters.semesters,
                ),
                SelectDateField(
                  begin: DateTime.parse('06.06.22'),
                  end: DateTime.parse('10.06.22'),
                ),
                const Spacer(),
                DoubleButton(
                  secondary: 'Сброс',
                  secondaryOnPressed: _dropFilter,
                  primary: 'Готово',
                  primaryOnPressed: () => _onDone(context),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

void _dropFilter() {
  GlobalParameters.dropFilter();
}

void _onDone(BuildContext context) {
  GlobalParameters.updateFiler();
  Navigator.pop(context);
}
