import 'package:flutter/material.dart';

const _height = 7.0;
const _width = 80.0;
const _borderRadius = 5.0;
const _margin = EdgeInsets.symmetric(vertical: 15.0);

class DragContainer extends StatelessWidget {
  const DragContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: _height,
      width: _width,
      margin: _margin,
      decoration: BoxDecoration(
        color: theme.disabledColor,
        borderRadius: BorderRadius.circular(_borderRadius),
      ),
    );
  }
}
