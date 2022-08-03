import 'package:flutter/material.dart';

import '../../../constants/measures.dart' as const_measures;
import 'widgets/widgets.dart';

const _textPadding = EdgeInsets.symmetric(
  horizontal: 2 * const_measures.mainHorMargin,
);

void showBottomOverlay({
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
    builder: (BuildContext context) {
      // TODO: find way to dynamically change size
      return Container(
        height: const_measures.bottomOverlayHeight,
        decoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(const_measures.overlayBorderRadius),
            topRight: Radius.circular(const_measures.overlayBorderRadius),
          ),
        ),
        child: Center(
          child: Column(
            children: [
              const DragContainer(),
              Expanded(
                child: Padding(
                  padding: _textPadding,
                  child: HighlightedTextSpan(
                    text: text,
                  ),
                ),
              ),
              DoubleButton(
                secondary: secondary,
                secondaryOnPressed: secondaryOnPressed,
                primary: primary,
                primaryOnPressed: primaryOnPressed,
              ),
            ],
          ),
        ),
      );
    },
  );
}
