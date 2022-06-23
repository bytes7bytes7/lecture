import 'package:flutter/material.dart';

import '../constants/measures.dart' as const_measures;
import 'sized_icon_button.dart';

const _automaticallyImplyLeading = false;

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({
    super.key,
    required this.title,
    this.titleStyle,
    this.prefix,
    this.prefixTooltip,
    this.prefixOnPressed,
    this.suffix,
    this.suffixTooltip,
    this.suffixOnPressed,
  });

  final String title;
  final TextStyle? titleStyle;
  final IconData? prefix;
  final String? prefixTooltip;
  final VoidCallback? prefixOnPressed;
  final IconData? suffix;
  final String? suffixTooltip;
  final VoidCallback? suffixOnPressed;

  @override
  Size get preferredSize => const Size.fromHeight(const_measures.appBarHeight);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final style = titleStyle;

    final prefIcon = prefix;
    final prefTooltip = prefixTooltip;
    final prefOnPressed = prefixOnPressed;

    final sufIcon = suffix;
    final sufTooltip = suffixTooltip;
    final sufOnPressed = suffixOnPressed;

    return AppBar(
      elevation: const_measures.appBarElevation,
      automaticallyImplyLeading: _automaticallyImplyLeading,
      backgroundColor: theme.scaffoldBackgroundColor,
      centerTitle: true,
      title: Text(
        title,
        style: style ?? theme.textTheme.headline2,
      ),
      leading:
          (prefIcon != null && prefTooltip != null && prefOnPressed != null)
              ? Container(
                  margin: const EdgeInsets.only(
                    left: const_measures.mainHorMargin,
                  ),
                  child: SizedIconButton(
                    icon: prefIcon,
                    tooltip: prefTooltip,
                    onPressed: prefOnPressed,
                  ),
                )
              : null,
      actions: [
        if (sufIcon != null && sufTooltip != null && sufOnPressed != null)
          Container(
            margin: const EdgeInsets.only(
              right: const_measures.mainHorMargin,
            ),
            child: SizedIconButton(
              icon: sufIcon,
              tooltip: sufTooltip,
              onPressed: sufOnPressed,
            ),
          )
      ],
    );
  }
}
