import 'package:flutter/material.dart';

import '../../../../constants/measures.dart' as const_measures;

class SizedIcon extends StatelessWidget {
  const SizedIcon({
    super.key,
    required this.icon,
    this.size = const_measures.bigIconSize,
    this.color,
  });

  final IconData icon;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Icon(
      icon,
      color: color ?? theme.primaryColor,
      size: size,
    );
  }
}
