import 'package:flutter/material.dart';
import 'package:lecture/constants.dart';

import 'rounded_button.dart';

class SelectItemRow extends StatelessWidget {
  const SelectItemRow({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final VoidFunction onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Flexible(
            flex: 4,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                border: Border.all(
                  color: Theme.of(context).focusColor,
                ),
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).focusColor.withOpacity(0.25),
                    offset: const Offset(0, 3),
                    spreadRadius: 0,
                    blurRadius: 4,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 20),
                  child: Text(
                    text,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 15.0),
          RoundedButton(
            data: Icons.search,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
