import 'package:flutter/material.dart';

class DragContainer extends StatelessWidget {
  const DragContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 25.0),
      height: 7.0,
      width: 80.0,
      decoration: BoxDecoration(
        color: Theme.of(context).disabledColor,
        borderRadius: BorderRadius.circular(5.0),
      ),
    );
  }
}
