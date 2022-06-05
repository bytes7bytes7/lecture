import 'package:flutter/material.dart';


class LineButton extends StatelessWidget {
  const LineButton({
    Key? key,
    this.icon,
    required this.text,
    this.actions = const [],
    required this.onPressed,
  }) : super(key: key);

  final IconData? icon;
  final String text;
  final List<Widget> actions;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final iconData = icon;

    return MaterialButton(
      padding: EdgeInsets.zero,
      minWidth: 0,
      onPressed: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                if (iconData != null) ...[
                  Icon(
                    iconData,
                    color: Theme.of(context).primaryColor,
                    size: 24.0,
                  ),
                  const SizedBox(width: 15.0),
                ],
                Text(
                  text,
                  style: Theme.of(context).textTheme.bodyText1,
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
