import 'package:flutter/material.dart';

import '../constants/measures.dart' as const_measures;

const _padding = EdgeInsets.symmetric(
  horizontal: 6,
  vertical: 4,
);

class Badge extends StatelessWidget {
  const Badge({
    Key? key,
    required this.value,
  }) : super(key: key);

  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: _padding,
      decoration: BoxDecoration(
        color: theme.primaryColor.withOpacity(const_measures.opacity),
        borderRadius: BorderRadius.circular(
          const_measures.mainBorderRadius,
        ),
      ),
      child: Text(
        value,
        style: theme.textTheme.subtitle1?.copyWith(color: theme.primaryColor),
        textAlign: TextAlign.center,
      ),
    );
  }
}
