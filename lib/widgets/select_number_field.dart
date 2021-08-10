import 'package:flutter/material.dart';

import '../constants.dart';
import 'sized_icon_button.dart';

class SelectNumberField extends StatelessWidget {
  const SelectNumberField({
    Key? key,
    required this.title,
    required this.number,
  }) : super(key: key);

  final String title;
  final int number;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 12.0),
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
              title,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          SizedIconButton(
            size: 24.0,
            icon: Icons.keyboard_arrow_left,
            onPressed: () {},
            message: ConstantMessages.less,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              number.toString(),
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          SizedIconButton(
            size: 24.0,
            icon: Icons.keyboard_arrow_right,
            onPressed: () {},
            message: ConstantMessages.more,
          ),
        ],
      ),
    );
  }
}
