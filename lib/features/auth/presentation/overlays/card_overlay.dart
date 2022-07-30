import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/measures.dart' as const_measures;
import '../widgets/widgets.dart';

const _padding = EdgeInsets.symmetric(
  horizontal: const_measures.mainHorMargin,
);

const _titleMargin = EdgeInsets.only(
  top: 30.0,
);

const _textMargin = EdgeInsets.symmetric(
  vertical: 10.0,
);

class CardOverlay extends ConsumerWidget {
  const CardOverlay({
    super.key,
    required this.title,
    required this.description,
    required this.body,
    this.subFooter = const SizedBox.shrink(),
    required this.footer,
  });

  final String title;
  final String description;
  final Widget body;
  final Widget subFooter;
  final Widget footer;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final constraints = ConstraintInherited.of(context).constraints;

    return Container(
      height: constraints.maxHeight,
      width: constraints.maxWidth,
      padding: _padding,
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(const_measures.overlayBorderRadius),
          topRight: Radius.circular(const_measures.overlayBorderRadius),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: _titleMargin,
            child: Text(
              title,
              style: theme.textTheme.headline5,
            ),
          ),
          Container(
            margin: _textMargin,
            child: Text(
              description,
              style: theme.textTheme.bodyText1,
            ),
          ),
          body,
          Flexible(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: subFooter,
            ),
          ),
          footer,
        ],
      ),
    );
  }
}
