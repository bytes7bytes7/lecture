import 'package:flutter/material.dart';

import '../../../../constants/measures.dart' as const_measures;

const _borderWidth = 1.0;

enum LineBorderType {
  top,
  bottom,
  vertical,
  none,
}

class LineButton extends StatelessWidget {
  const LineButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.actions = const [],
    this.borderType = LineBorderType.none,
  });

  final String text;
  final VoidCallback onPressed;
  final IconData? icon;
  final List<Widget> actions;
  final LineBorderType borderType;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final iconData = icon;

    return MaterialButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 12.0,
        ),
        decoration: BoxDecoration(
          border: Border(
            top: (borderType == LineBorderType.top ||
                    borderType == LineBorderType.vertical)
                ? BorderSide(
                    color: theme.hintColor,
                    width: _borderWidth,
                  )
                : BorderSide.none,
            bottom: (borderType == LineBorderType.bottom ||
                    borderType == LineBorderType.vertical)
                ? BorderSide(
                    color: theme.hintColor,
                    width: _borderWidth,
                  )
                : BorderSide.none,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                if (iconData != null)
                  Icon(
                    iconData,
                    color: theme.primaryColor,
                    size: const_measures.midIconSize,
                  ),
                const SizedBox(width: const_measures.midIconSize / 2),
                Text(
                  text,
                  style: theme.textTheme.bodyText1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            ...actions,
          ],
        ),
      ),
    );
  }
}
