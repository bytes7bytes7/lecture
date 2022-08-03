import 'package:flutter/material.dart';

import '../../../../constants/measures.dart' as const_measures;

const _blurRadius = 8.0;
const _margin = EdgeInsets.symmetric(
  vertical: const_measures.mainVerMargin / 2,
);
const _textPadding = EdgeInsets.symmetric(
  horizontal: const_measures.midPadding,
  vertical: const_measures.smallPadding,
);

class SelectItem extends StatelessWidget {
  const SelectItem({
    super.key,
    required this.value,
    required this.onSelect,
  });

  final String value;
  final void Function() onSelect;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: _margin,
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(
          const_measures.mainBorderRadius,
        ),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withOpacity(
              const_measures.smallOpacity,
            ),
            offset: const_measures.shadowOffset,
            blurRadius: _blurRadius,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          const_measures.mainBorderRadius,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onSelect,
            child: Padding(
              padding: _textPadding,
              child: Text(
                value,
                style: theme.textTheme.bodyText1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
