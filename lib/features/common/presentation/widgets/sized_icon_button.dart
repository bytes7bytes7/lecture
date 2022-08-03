import 'package:flutter/material.dart';

import '../../../../constants/measures.dart' as const_measures;

const _splashRadius = 22.0;
const _showDuration = Duration(seconds: 2);

class SizedIconButton extends StatelessWidget {
  const SizedIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.tooltip,
    this.size = const_measures.bigIconSize,
    this.splashRadius = _splashRadius,
    this.color,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final String tooltip;
  final double size;
  final double splashRadius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // TODO: hoverColor disappears on filter overlay
    return SizedBox(
      height: size,
      width: size,
      child: Tooltip(
        message: tooltip,
        showDuration: _showDuration,
        child: IconButton(
          padding: EdgeInsets.zero,
          icon: Icon(
            icon,
            color: color ?? theme.primaryColor,
            size: size,
          ),
          splashRadius: splashRadius,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
