import 'package:flutter/material.dart';

class LeadingIconButton extends StatelessWidget {
  const LeadingIconButton({
    Key? key,
    required this.icon,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.all(0),
      icon: Icon(
        icon,
        color: color,
        size: 36.0,
      ),
      //alignment: Alignment.centerLeft,
      splashRadius: 22.0,
      onPressed: onPressed,
    );
  }
}
