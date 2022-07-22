import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/measures.dart' as const_measures;
import '../l10n/l10n.dart';
import '../scope/app_scope.dart';
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

class SelectDateField extends ConsumerWidget {
  const SelectDateField({
    super.key,
    this.begin,
    this.end,
  });

  final DateTime? begin;
  final DateTime? end;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    final firstDate = begin;
    final lastDate = end;
    late final String period;

    // TODO: remake period
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
        period = '';
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
            tooltip: l10n.tooltipChoose,
            onPressed: () {
              // try use showDatePicker()
              ref.read(AppScope.get().loggerManager).info('Выбрать дату');
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
