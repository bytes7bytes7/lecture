import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/measures.dart' as const_measures;
import '../l10n/l10n.dart';
import '../scope/app_scope.dart';
import '../widgets/default_app_bar.dart';
import '../widgets/line_button.dart';

const _padding = EdgeInsets.fromLTRB(
  const_measures.mainHorMargin,
  15.0,
  const_measures.mainHorMargin,
  20.0,
);

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return Scaffold(
      appBar: DefaultAppBar(
        prefix: Icons.arrow_back,
        prefixTooltip: l10n.tooltipBack,
        prefixOnPressed: () {
          Navigator.pop(context);
        },
        title: l10n.colorThemeTitle,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: _padding,
            child: Text(
              l10n.colorThemeDesc,
              style: theme.textTheme.bodyText1,
            ),
          ),
          const _Body(),
        ],
      ),
    );
  }
}

class _Body extends ConsumerWidget {
  // ignore: unused_element
  const _Body({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    final colorTheme = ref.watch(AppScope.get().colorTheme);

    return Column(
      children: ColorTheme.values.map((e) {
        return LineButton(
          text: _getThemeTitle(e, l10n),
          borderType: LineBorderType.bottom,
          onPressed: () => _changeTheme(ref, curr: colorTheme, next: e),
          actions: [
            Icon(
              (colorTheme == e)
                  ? Icons.radio_button_on
                  : Icons.radio_button_off,
              color: theme.primaryColor,
              size: const_measures.smallIconSize,
            ),
          ],
        );
      }).toList(),
    );
  }

  void _changeTheme(
    WidgetRef ref, {
    required ColorTheme curr,
    required ColorTheme next,
  }) {
    if (curr != next) {
      ref.read(AppScope.get().colorTheme.notifier).set(next);
    }
  }

  String _getThemeTitle(ColorTheme theme, AppLocalizations l10n) {
    switch (theme) {
      case ColorTheme.light:
        return l10n.lightTheme;
      case ColorTheme.dark:
        return l10n.darkTheme;
      case ColorTheme.system:
        return l10n.systemTheme;
    }
  }
}
