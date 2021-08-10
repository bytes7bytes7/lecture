import 'package:flutter/material.dart';
import 'package:lecture/widgets/double_button.dart';

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
    constraints: const BoxConstraints(maxHeight: 510),
    builder: (BuildContext context) {
      return Container(
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
              const SelectField(
                text: 'Физико-технический факультет',
                defaultText: 'Факультет',
              ),
              const SelectField(
                text: '',
                defaultText: 'Уровень высшего образования',
              ),
              const SelectField(
                text: '',
                defaultText: 'Предмет',
              ),
              const SelectNumberField(
                title: 'Семестр',
                number: 2,
              ),
              const SelectDateField(
                startDate: '06.08.21',
                endDate: '10.08.21',
              ),
              DoubleButton(
                prefix: 'Сброс',
                prefixOnPressed: () {},
                suffix: 'Готово',
                suffixOnPressed: () {},
              ),
            ],
          ),
        ),
      );
    },
  );
}
