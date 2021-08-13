import 'package:flutter/material.dart';

import '../global_parameters.dart';
import '../widgets/double_button.dart';
import '../widgets/select_date_field.dart';
import '../widgets/select_number_field.dart';
import '../widgets/select_field.dart';
import '../widgets/drag_container.dart';

void showFilterOverlay(
  BuildContext context,
) {
  showModalBottomSheet<void>(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (BuildContext context) {
      // TODO: find way to dynamically change size
      return FractionallySizedBox(
        heightFactor: 0.7,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
          child: Center(
            child: Column(
              children: <Widget>[
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
                  defaultText: '-',
                  min: 1,
                  max: GlobalParameters.semesters,
                ),
                const SelectDateField(
                  startDate: '06.08.21',
                  endDate: '10.08.21',
                ),
                /// I can use showDatePicker()
                const Spacer(),
                DoubleButton(
                  prefix: 'Сброс',
                  prefixOnPressed: () {
                    GlobalParameters.dropFilter();
                  },
                  suffix: 'Готово',
                  suffixOnPressed: () {
                    GlobalParameters.updateFiler();
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
