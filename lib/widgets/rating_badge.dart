import 'package:flutter/material.dart';
import 'package:rest_client/rest_client.dart';

import '../constants/measures.dart' as const_measures;

const _badgeIconSize = 14.0;
const _textPadding = EdgeInsets.symmetric(horizontal: 10.0);

class RatingBadge extends StatelessWidget {
  const RatingBadge({
    super.key,
    required this.rating,
    required this.amount,
  });

  final Rating rating;
  final double amount;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          const_measures.mainBorderRadius,
        ),
        color: _background(context),
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(
              const_measures.badgeMargin,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _foreground(context),
            ),
            child: Padding(
              padding: const EdgeInsets.all(
                const_measures.badgeMargin,
              ),
              child: Icon(
                Icons.star,
                color: theme.scaffoldBackgroundColor,
                size: _badgeIconSize,
              ),
            ),
          ),
          Padding(
            padding: _textPadding,
            child: _text(context),
          ),
        ],
      ),
    );
  }

  Color _background(BuildContext context) {
    final theme = Theme.of(context);

    switch (rating) {
      case Rating.excellent:
        return theme.primaryColor.withOpacity(const_measures.smallOpacity);
      case Rating.good:
        return theme.indicatorColor.withOpacity(const_measures.smallOpacity);
      case Rating.bad:
        return theme.errorColor.withOpacity(const_measures.smallOpacity);
      case Rating.unknown:
        return theme.disabledColor;
    }
  }

  Color _foreground(BuildContext context) {
    final theme = Theme.of(context);

    switch (rating) {
      case Rating.excellent:
        return theme.primaryColor;
      case Rating.good:
        return theme.indicatorColor;
      case Rating.bad:
        return theme.errorColor;
      case Rating.unknown:
        return theme.hintColor;
    }
  }

  Widget _text(BuildContext context) {
    final theme = Theme.of(context);

    final text = amount.toStringAsFixed(2);

    late final Color color;
    switch (rating) {
      case Rating.excellent:
        color = theme.primaryColor;
        break;
      case Rating.good:
        color = theme.indicatorColor;
        break;
      case Rating.bad:
        color = theme.errorColor;
        break;
      case Rating.unknown:
        color = theme.hintColor;
        break;
    }

    return Text(
      text,
      style: theme.textTheme.subtitle2?.copyWith(
        color: color,
      ),
    );
  }
}
