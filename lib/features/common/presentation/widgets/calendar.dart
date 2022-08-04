import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../constants/measures.dart' as const_measures;
import '../../domain/string_x.dart';
import 'sized_icon.dart';

const _delta = Duration(days: 365 * 100);
const _daysOfWeekHeight = 30.0;
const _radius = 2 * const_measures.mainBorderRadius;

class Calendar extends StatefulWidget {
  const Calendar({
    super.key,
    this.focusedDay,
    this.canSelectRange = true,
  });

  final DateTime? focusedDay;
  final bool canSelectRange;

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late DateTime _focused;
  DateTime? _selected;
  DateTime? _startDay;
  DateTime? _endDay;
  var _selectionMode = RangeSelectionMode.toggledOff;

  @override
  void initState() {
    super.initState();

    _focused = widget.focusedDay ?? DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final today = DateTime.now();
    final locale = Localizations.localeOf(context).toString();

    return TableCalendar(
      locale: locale,
      focusedDay: _focused,
      firstDay: today.subtract(_delta),
      lastDay: today.add(_delta),
      rangeStartDay: _startDay,
      rangeEndDay: _endDay,
      daysOfWeekHeight: _daysOfWeekHeight,
      rangeSelectionMode: _selectionMode,
      startingDayOfWeek: StartingDayOfWeek.monday,
      selectedDayPredicate: _selectedDayPredicate,
      onDaySelected: _onDaySelected,
      onRangeSelected: widget.canSelectRange ? _onRangeSelected : null,
      availableGestures: AvailableGestures.horizontalSwipe,
      headerStyle: HeaderStyle(
        titleCentered: true,
        formatButtonVisible: false,
        leftChevronIcon: SizedIcon(
          icon: Icons.keyboard_arrow_left,
          size: const_measures.midIconSize,
          color: theme.iconTheme.color,
        ),
        rightChevronIcon: SizedIcon(
          icon: Icons.keyboard_arrow_right,
          size: const_measures.midIconSize,
          color: theme.iconTheme.color,
        ),
        titleTextStyle: theme.textTheme.headline5?.copyWith(
              color: theme.primaryColor,
            ) ??
            const TextStyle(),
        titleTextFormatter: (date, locale) {
          if (date.year == today.year) {
            return DateFormat.LLLL(locale).format(date).capitalized;
          }

          return DateFormat('LLLL y', locale).format(date).capitalized;
        },
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: _textStyle(theme.textTheme.bodyText1),
        weekendStyle: _textStyle(theme.textTheme.bodyText1),
        dowTextFormatter: (date, locale) {
          return DateFormat.E(locale).format(date).capitalized;
        },
      ),
      calendarStyle: CalendarStyle(
        rangeHighlightColor: theme.primaryColor.withOpacity(
          const_measures.smallOpacity,
        ),
        selectedTextStyle: _textStyle(
          theme.textTheme.bodyText1
              ?.copyWith(color: theme.scaffoldBackgroundColor),
        ),
        defaultTextStyle: _textStyle(theme.textTheme.bodyText1),
        outsideTextStyle: _textStyle(
          theme.textTheme.bodyText1?.copyWith(
            color: theme.hintColor,
          ),
        ),
        weekendTextStyle: _textStyle(theme.textTheme.bodyText1),
        holidayTextStyle: _textStyle(theme.textTheme.bodyText1),
        todayTextStyle: _textStyle(
          theme.textTheme.bodyText1?.copyWith(
            color: theme.shadowColor,
          ),
        ),
        selectedDecoration: BoxDecoration(
          color: theme.primaryColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(
            const_measures.mainBorderRadius,
          ),
        ),
        defaultDecoration: const BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.rectangle,
        ),
        todayDecoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(
            const_measures.mainBorderRadius,
          ),
          border: Border.all(
            color: theme.primaryColor,
          ),
        ),
        rangeStartDecoration: BoxDecoration(
          color: theme.primaryColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(
              _radius,
            ),
            bottomLeft: Radius.circular(
              _radius,
            ),
          ),
        ),
        withinRangeDecoration: const BoxDecoration(
          shape: BoxShape.rectangle,
        ),
        holidayDecoration: const BoxDecoration(
          shape: BoxShape.rectangle,
        ),
        outsideDecoration: const BoxDecoration(
          shape: BoxShape.rectangle,
        ),
        disabledDecoration: const BoxDecoration(
          shape: BoxShape.rectangle,
        ),
        weekendDecoration: const BoxDecoration(
          shape: BoxShape.rectangle,
        ),
        rangeEndDecoration: BoxDecoration(
          color: theme.primaryColor,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(
              _radius,
            ),
            bottomRight: Radius.circular(
              _radius,
            ),
          ),
        ),
      ),
    );
  }

  TextStyle _textStyle(TextStyle? style) {
    return style ?? const TextStyle();
  }

  bool _selectedDayPredicate(DateTime day) {
    return isSameDay(_selected, day);
  }

  void _onDaySelected(DateTime selected, DateTime focused) {
    if (!isSameDay(_selected, selected)) {
      setState(() {
        _selected = selected;
        _focused = focused;
        _endDay = _startDay = null;
        _selectionMode = RangeSelectionMode.toggledOff;
      });
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selected = null;
      _focused = focusedDay;
      _startDay = start;
      _endDay = end;
      _selectionMode = RangeSelectionMode.toggledOn;
    });
  }
}
