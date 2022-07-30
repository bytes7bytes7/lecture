import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const _positionedDuration = Duration(milliseconds: 300);

class ListeningOverlay extends ConsumerWidget {
  const ListeningOverlay({
    super.key,
    required this.notifier,
    required this.overlay,
  });

  final StateProvider<bool> notifier;
  final Widget overlay;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final isOpen = ref.watch(notifier);

    return AnimatedPositioned(
      left: isOpen ? 0 : size.width,
      duration: _positionedDuration,
      curve: Curves.easeInOut,
      child: overlay,
    );
  }
}
