import 'package:flutter/material.dart';

import '../../../constants/measures.dart' as const_measures;
import 'widgets/widgets.dart';

const _textPadding = EdgeInsets.symmetric(
  horizontal: const_measures.mainHorMargin,
  vertical: 2 * const_measures.mainVerMargin,
);
const _btnPadding = EdgeInsets.symmetric(
  horizontal: const_measures.mainHorMargin,
);

void showQuestionBottomOverlay({
  required BuildContext context,
  required String text,
  required String primary,
  required VoidCallback primaryOnPressed,
  required String secondary,
  required VoidCallback secondaryOnPressed,
}) {
  final theme = Theme.of(context);

  showModalBottomSheet<void>(
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
                Container(
                  alignment: Alignment.center,
                  padding: _textPadding,
                  child: HighlightedTextSpan(
                    text: text,
                  ),
                ),
                Padding(
                  padding: _btnPadding,
                  child: DoubleButton(
                    secondary: secondary,
                    secondaryOnPressed: secondaryOnPressed,
                    primary: primary,
                    primaryOnPressed: primaryOnPressed,
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
