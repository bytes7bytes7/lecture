import 'package:flutter/material.dart';

import '../constants/measures.dart' as const_measures;
import '../widgets/double_button.dart';
import '../widgets/drag_container.dart';

const _textPadding = EdgeInsets.symmetric(
  horizontal: 2 * const_measures.mainHorMargin,
);

void showBottomOverlay({
  required BuildContext context,
  required List<TextSpan> textSpans,
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
                  child: RichText(
                    softWrap: true,
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: textSpans,
                    ),
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
