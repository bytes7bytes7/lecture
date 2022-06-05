import 'package:flutter/material.dart';

class SizedIconButton extends StatelessWidget {
  const SizedIconButton({
    Key? key,
    this.size = 36.0,
    required this.icon,
    required this.onPressed,
    required this.message,
    this.splashRadius = 22,
  }) : super(key: key);

  final double size;
  final IconData icon;
  final VoidCallback onPressed;
  final String message;
  final double splashRadius;

  @override
  Widget build(BuildContext context) {
    // TODO: hoverColor disappears on filter overlay
    return SizedBox(
      height: size,
      width: size,
      child: Tooltip(
        message: message,
        showDuration: const Duration(seconds: 2),
        child: IconButton(
          padding: EdgeInsets.zero,
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
