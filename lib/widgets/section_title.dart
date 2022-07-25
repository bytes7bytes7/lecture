import 'package:flutter/material.dart';

import '../constants/measures.dart' as const_measures;

const _padding = EdgeInsets.symmetric(
  horizontal: const_measures.mainHorMargin,
  vertical: 15.0,
);

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: _padding,
      child: Text(
        title,
        style: theme.textTheme.subtitle2,
      ),
    );
  }
}
