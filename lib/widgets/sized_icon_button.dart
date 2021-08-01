import 'package:flutter/material.dart';
import 'package:lecture/constants.dart';

class SizedIconButton extends StatelessWidget {
  const SizedIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    required this.message,
    this.splashRadius = 14,
  }) : super(key: key);

  final double size = 22;
  final IconData icon;
  final VoidFunction onPressed;
  final String message;
  final double splashRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: Tooltip(
        message: message,
        showDuration: const Duration(seconds: 2),
        padding: const EdgeInsets.all(0),
        textStyle: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(color: Theme.of(context).scaffoldBackgroundColor),
        child: IconButton(
          padding: const EdgeInsets.all(0),
          icon: Icon(
            icon,
            color: Theme.of(context).focusColor,
            size: size,
          ),
          splashRadius: splashRadius,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
