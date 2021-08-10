import 'package:flutter/material.dart';
import 'package:lecture/constants.dart';

class SizedIconButton extends StatelessWidget {
  const SizedIconButton({
    Key? key,
    this.size = 36.0,
    required this.icon,
    required this.onPressed,
    required this.message,
    this.splashRadius = 14,
  }) : super(key: key);

  final double size;
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
        child: IconButton(
          padding: const EdgeInsets.all(0),
          icon: Icon(
            icon,
            color: Theme.of(context).primaryColor,
            size: size,
          ),
          splashRadius: splashRadius,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
