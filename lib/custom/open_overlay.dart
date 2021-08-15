import 'package:flutter/material.dart';

abstract class OverlayViewer {
  static double? height;
  static OverlayEntry? overlayEntry;

  static void openOverlay({
    required BuildContext context,
    required Widget overlay,
  }) async {
    if (height == null) {
      final double fullHeight = MediaQuery.of(context).size.height;
      final EdgeInsets padding = MediaQuery.of(context).padding;
      height = fullHeight - padding.top - padding.bottom;
    }
    OverlayState overlayState = Overlay.of(context)!;
    if (overlayEntry != null) {
      overlayEntry!.remove();
    }
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned.fill(
        left: 0,
        right: 0,
        bottom: 0,
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: SizedBox(
                  height: height,
                  child: Column(
                    children: [
                      Flexible(
                        child: Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            height:
                                Theme.of(context).textTheme.headline1!.fontSize,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: overlay,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    overlayState.insert(overlayEntry!);
  }
}
