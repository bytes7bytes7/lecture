import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const _positionedDuration = Duration(milliseconds: 300);

class ListeningOverlay extends ConsumerWidget {
  const ListeningOverlay({
    super.key,
    required this.isOpen,
    required this.overlay,
  });

  final bool isOpen;
  final Widget overlay;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    return AnimatedPositioned(
      left: isOpen ? 0 : size.width,
      duration: _positionedDuration,
      curve: Curves.easeInOut,
      child: overlay,
    );
  }
}
