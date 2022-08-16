import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '../../../../constants/measures.dart' as const_measures;
import '../../../../l10n/l10n.dart';

const _margin = 2.0;

class StatusBadge extends StatelessWidget {
  const StatusBadge({
    super.key,
    required this.status,
  });

  final Status status;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return PopupMenuButton(
      padding: EdgeInsets.zero,
      position: PopupMenuPosition.under,
      tooltip: l10n.tooltipInfo,
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            enabled: false,
            child: Text(
              status == Status.onMod ? l10n.onModeration : l10n.declined,
              style: theme.textTheme.bodyText1,
            ),
          ),
        ];
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: _background(context),
          shape: BoxShape.circle,
        ),
        child: Icon(
          _icon(context),
          size: const_measures.midIconSize - 2 * _margin,
          color: theme.scaffoldBackgroundColor,
        ),
      ),
    );
  }

  Color _background(BuildContext context) {
    final theme = Theme.of(context);

    switch (status) {
      case Status.onMod:
        return theme.indicatorColor;
      case Status.declined:
        return theme.errorColor;
      default:
        return Colors.transparent;
    }
  }

  IconData _icon(BuildContext context) {
    switch (status) {
      case Status.onMod:
        return Icons.person_search;
      case Status.declined:
        return Icons.error_outline;
      default:
        return Icons.info;
    }
  }
}
