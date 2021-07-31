import 'package:flutter/material.dart';

import '../constants.dart';


class RoundedIconButton extends StatelessWidget {
  const RoundedIconButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final VoidFunction onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: Material(
          child: InkWell(
            onTap: onPressed,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Icon(
                Icons.filter_alt_outlined,
                color: Theme.of(context).focusColor,
                size: 25.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
