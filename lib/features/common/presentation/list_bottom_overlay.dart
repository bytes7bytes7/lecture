import 'package:flutter/material.dart';

import '../../../constants/measures.dart' as const_measures;
import 'widgets/widgets.dart';

const _padding = EdgeInsets.symmetric(
  horizontal: const_measures.mainHorMargin,
  vertical: 2 * const_measures.mainVerMargin,
);

Future<T?> showListBottomOverlay<T>({
  required BuildContext context,
  required List<Widget> actions,
}) async {
  final theme = Theme.of(context);

  return showModalBottomSheet<T>(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Wrap(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: theme.scaffoldBackgroundColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(
                  const_measures.overlayBorderRadius,
                ),
                topRight: Radius.circular(
                  const_measures.overlayBorderRadius,
                ),
              ),
            ),
            child: Column(
              children: [
                const DragContainer(),
                Padding(
                  padding: _padding,
                  child: Column(
                    children: actions,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}
