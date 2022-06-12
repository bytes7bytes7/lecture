import 'package:flutter/material.dart';

const _strokeWidth = 2.0;

class LoadingCircle extends StatelessWidget {
  const LoadingCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: CircularProgressIndicator(
        color: theme.primaryColor,
        strokeWidth: _strokeWidth,
      ),
    );
  }
}
