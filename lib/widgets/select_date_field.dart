import 'package:flutter/material.dart';

import '../constants/tooltips.dart' as const_tooltips;
import 'sized_icon_button.dart';

class SelectDateField extends StatelessWidget {
  const SelectDateField({
    Key? key,
    required this.startDate,
    this.endDate = '',
  }) : super(key: key);

  final String startDate;
  final String endDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(25.0, 12.0, 25.0, 0.0),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Theme.of(context).primaryColor,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              (endDate.isNotEmpty) ? '$startDate - $endDate' : startDate,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          SizedIconButton(
            size: 24.0,
            icon: Icons.date_range,
            onPressed: () {},
            message: const_tooltips.choose,
          ),
        ],
      ),
    );
  }
}
