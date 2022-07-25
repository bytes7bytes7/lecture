import 'package:flutter/material.dart';

import '../constants/measures.dart' as const_measures;

const _width = 250.0;
const _margin = EdgeInsets.only(bottom: 20.0);

class SingleButton extends StatelessWidget {
  const SingleButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: const_measures.buttonHeight,
        width: _width,
        margin: _margin,
        child: OutlinedButton(
          onPressed: onPressed,
          child: Text(
            text,
          ),
        ),
      ),
    );
  }
}
