import 'package:flutter/material.dart';
import 'package:quick_quotes_quill/spread_quill_manager.dart';

import '../constants/measures.dart' as const_measures;
import '../constants/tooltips.dart' as const_tooltips;
import 'sized_icon_button.dart';

const _margin = EdgeInsets.only(
  left: const_measures.mainHorMargin,
  top: 12.0,
  right: const_measures.mainHorMargin,
  bottom: 0,
);

const _padding = EdgeInsets.symmetric(
  horizontal: 20,
  vertical: 10,
);

class SelectDateField extends StatelessWidget {
  const SelectDateField({
    super.key,
    this.begin,
    this.end,
  });

  final DateTime? begin;
  final DateTime? end;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final firstDate = begin;
    final lastDate = end;
    late final String period;
    if (firstDate != null) {
      if (lastDate != null) {
        period = '${_dayMonthYear(firstDate)} - ${_dayMonthYear(lastDate)}';
      } else {
        period = 'с ${_dayMonthYear(firstDate)}';
      }
    } else {
      if (lastDate != null) {
        period = 'до ${_dayMonthYear(lastDate)}';
      } else {
        period = 'за все время';
      }
    }

    return Container(
      margin: _margin,
      padding: _padding,
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(
          const_measures.mainBorderRadius,
        ),
        border: Border.all(
          color: theme.primaryColor,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              period,
              style: theme.textTheme.bodyText1,
            ),
          ),
          SizedIconButton(
            icon: Icons.date_range,
            size: const_measures.smallIconSize,
            tooltip: const_tooltips.choose,
            onPressed: () {
              // try use showDatePicker()
              SpreadQuillManager.inst.info('Выбрать дату');
            },
          ),
        ],
      ),
    );
  }

  String _dayMonthYear(DateTime dt) {
    final day = '${dt.day}'.padLeft(2, '0');
    final month = '${dt.month}'.padLeft(2, '0');
    final year = '${dt.year}'.substring(2);

    return '$day.$month.$year';
  }
}
