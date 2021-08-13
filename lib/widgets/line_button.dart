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
    return MaterialButton(
      padding: const EdgeInsets.all(0),
      minWidth: 0,
      onPressed: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Row(
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                color: Theme.of(context).primaryColor,
                size: 24.0,
              ),
              const SizedBox(width: 15.0),
            ],
            Expanded(
              child: Text(
                text,
                style: Theme.of(context).textTheme.bodyText1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Spacer(),
            ...actions,
          ],
        ),
      ),
    );
  }
}
