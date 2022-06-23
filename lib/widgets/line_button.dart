import 'package:flutter/material.dart';

import '../constants/measures.dart' as const_measures;

const _borderWidth = 1.0;

enum LineBorderType {
  left,
  top,
  right,
  bottom,
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
        margin: const EdgeInsets.symmetric(
          horizontal: const_measures.mainHorMargin,
        ),
        decoration: BoxDecoration(
          border: (borderType == LineBorderType.left)
              ? Border(
                  left: BorderSide(
                    color: theme.hintColor,
                    width: _borderWidth,
                  ),
                )
              : (borderType == LineBorderType.top)
                  ? Border(
                      top: BorderSide(
                        color: theme.hintColor,
                        width: _borderWidth,
                      ),
                    )
                  : (borderType == LineBorderType.right)
                      ? Border(
                          right: BorderSide(
                            color: theme.hintColor,
                            width: _borderWidth,
                          ),
                        )
                      : (borderType == LineBorderType.bottom)
                          ? Border(
                              bottom: BorderSide(
                                color: theme.hintColor,
                                width: _borderWidth,
                              ),
                            )
                          : null,
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
                    size: const_measures.smallIconSize,
                  ),
                const SizedBox(width: const_measures.smallIconSize / 2),
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
