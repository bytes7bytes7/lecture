import 'package:flutter/material.dart';

import 'sized_icon_button.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({
    Key? key,
    required this.prefix,
    required this.prefixMessage,
    required this.text,
    required this.prefixOnPressed,
    this.suffix,
    this.suffixMessage = '',
    this.suffixOnPressed,
  }) : super(key: key);

  final IconData prefix;
  final String prefixMessage;
  final VoidCallback prefixOnPressed;
  final String text;
  final IconData? suffix;
  final String suffixMessage;
  final VoidCallback? suffixOnPressed;

  @override
  Size get preferredSize => const Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      automaticallyImplyLeading: false,
      titleSpacing: 25.0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedIconButton(
            icon: prefix,
            message: prefixMessage,
            onPressed: prefixOnPressed,
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.headline2,
          ),
          if (suffix != null)
            SizedIconButton(
              icon: suffix!,
              message: suffixMessage,
              onPressed: suffixOnPressed ?? () {},
            )
          else
            SizedBox(
              width: SizedIconButton(
                icon: prefix,
                message: '',
                onPressed: () {},
              ).size,
            ),
        ],
      ),
    );
  }
}
