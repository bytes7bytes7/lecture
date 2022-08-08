import 'package:flutter/material.dart';

import '../../../../constants/measures.dart' as const_measures;
import 'copy_text.dart';
import 'sized_icon_button.dart';

class AppBarButtonConfig {
  AppBarButtonConfig({
    required this.icon,
    required this.tooltip,
    required this.onPressed,
  });

  final IconData icon;
  final String tooltip;
  final VoidCallback onPressed;
}

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({
    super.key,
    required this.title,
    this.canCopyTitle = false,
    this.titleStyle,
    this.prefix,
    this.prefixConfig,
    this.suffix,
    this.suffixConfig,
  })  : assert(
          prefix == null || prefixConfig == null,
          'set prefix or prefixConf',
        ),
        assert(
          suffix == null || suffixConfig == null,
          'set suffix or suffixConf',
        );

  final String title;
  final bool canCopyTitle;
  final TextStyle? titleStyle;
  final Widget? prefix;
  final AppBarButtonConfig? prefixConfig;
  final Widget? suffix;
  final AppBarButtonConfig? suffixConfig;

  @override
  Size get preferredSize => const Size.fromHeight(const_measures.appBarHeight);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final style = titleStyle;

    final pref = prefix;
    final prefCon = prefixConfig;

    final suf = suffix;
    final sufCon = suffixConfig;

    return AppBar(
      title: canCopyTitle
          ? CopyText(
              text: title,
              style: style ?? theme.appBarTheme.titleTextStyle,
            )
          : Text(
              title,
              style: style ?? theme.appBarTheme.titleTextStyle,
            ),
      automaticallyImplyLeading: false,
      leading: (prefCon != null)
          ? Container(
              margin: const EdgeInsets.only(
                left: const_measures.mainHorMargin,
              ),
              child: SizedIconButton(
                icon: prefCon.icon,
                tooltip: prefCon.tooltip,
                onPressed: prefCon.onPressed,
              ),
            )
          : (pref != null)
              ? pref
              : null,
      actions: (suf != null)
          ? [suf]
          : [
              if (sufCon != null)
                Container(
                  margin: const EdgeInsets.only(
                    right: const_measures.mainHorMargin,
                  ),
                  child: SizedIconButton(
                    icon: sufCon.icon,
                    tooltip: sufCon.tooltip,
                    onPressed: sufCon.onPressed,
                  ),
                ),
            ],
    );
  }
}
