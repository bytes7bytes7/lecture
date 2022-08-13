import 'package:flutter/material.dart';

const _strokeWidth = 2.0;

class LoadingCircle extends StatelessWidget {
  const LoadingCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: RepaintBoundary(
        child: CircularProgressIndicator(
          strokeWidth: _strokeWidth,
        ),
      ),
    );
  }
}
