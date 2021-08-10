import 'package:flutter/material.dart';

import '../constants.dart';
import 'sized_icon_button.dart';

class SelectField extends StatelessWidget {
  const SelectField({
    Key? key,
    required this.text,
    required this.defaultText,
  }) : super(key: key);

  final String text;
  final String defaultText;

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
            child: (text.isNotEmpty)
                ? Text(
                    text,
                    style: Theme.of(context).textTheme.bodyText1,
                  )
                : Text(
                    defaultText,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Theme.of(context).hintColor),
                  ),
          ),
          SizedIconButton(
            size: 24.0,
            icon: Icons.search,
            onPressed: () {},
            message: ConstantMessages.choose,
          ),
        ],
      ),
    );
  }
}
