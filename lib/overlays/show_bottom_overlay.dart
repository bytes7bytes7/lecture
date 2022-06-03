import 'package:flutter/material.dart';

import '../widgets/double_button.dart';
import '../widgets/drag_container.dart';

void showBottomOverlay({
  required BuildContext context,
  required List<TextSpan> textSpans,
  required String prefix,
  required VoidCallback prefixOnPressed,
  required String suffix,
  required VoidCallback suffixOnPressed,
}) {
  showModalBottomSheet<void>(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      // TODO: find way to dynamically change size
      return Container(
        height: 250,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: Center(
          child: Column(
            children: <Widget>[
              const DragContainer(),
              const Spacer(),
              RichText(
                softWrap: true,
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: textSpans,
                ),
              ),
              const Spacer(),
              DoubleButton(
                prefix: prefix,
                prefixOnPressed: prefixOnPressed,
                suffix: suffix,
                suffixOnPressed: suffixOnPressed,
              ),
            ],
          ),
        ),
      );
    },
  );
}
