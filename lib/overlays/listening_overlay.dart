import 'package:flutter/material.dart';

const _positionedDuration = Duration(milliseconds: 300);

class ListeningOverlay extends StatelessWidget {
  const ListeningOverlay({
    super.key,
    required this.notifier,
    required this.overlay,
  });

  final ValueNotifier<bool> notifier;
  final Widget overlay;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ValueListenableBuilder<bool>(
      valueListenable: notifier,
      builder: (context, value, child) {
        return AnimatedPositioned(
          left: value ? 0 : size.width,
          duration: _positionedDuration,
          curve: Curves.easeInOut,
          child: overlay,
        );
      },
    );
  }
}
