import 'package:flutter/material.dart';

import '../constants/measures.dart' as const_measures;

const _width = 250.0;
const _margin = EdgeInsets.only(bottom: 20.0);

class SingleButton extends StatelessWidget {
  const SingleButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Align(
      alignment: Alignment.center,
      child: Container(
        height: const_measures.buttonHeight,
        width: _width,
        margin: _margin,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.zero,
            primary: theme.scaffoldBackgroundColor,
            backgroundColor: theme.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                const_measures.buttonBorderRadius,
              ),
            ),
            side: const BorderSide(
              style: BorderStyle.none,
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: theme.textTheme.subtitle1
                ?.copyWith(color: theme.scaffoldBackgroundColor),
          ),
        ),
      ),
    );
  }
}
