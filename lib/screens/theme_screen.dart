import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/measures.dart' as const_measures;
import '../features/common/common.dart';
import '../l10n/l10n.dart';
import '../scope/app_scope.dart';

const _padding = EdgeInsets.symmetric(
  horizontal: const_measures.mainHorMargin,
  vertical: const_measures.mainVerMargin,
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
        prefixConfig: AppBarButtonConfig(
          icon: Icons.arrow_back,
          tooltip: l10n.tooltipBack,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: const_measures.mainHorMargin,
      ),
      child: Column(
        children: AdaptiveThemeMode.values.map((e) {
          return LineButton(
            text: _getThemeTitle(e, l10n),
            borderType: LineBorderType.bottom,
            onPressed: () => _changeTheme(ref: ref, value: e),
            actions: [
              Icon(
                (colorTheme == e)
                    ? Icons.radio_button_on
                    : Icons.radio_button_off,
                color: theme.primaryColor,
                size: const_measures.midIconSize,
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  void _changeTheme({
    required WidgetRef ref,
    required AdaptiveThemeMode value,
  }) {
    ref.read(AppScope.get().colorTheme.notifier).set(value);
  }

  String _getThemeTitle(AdaptiveThemeMode theme, AppLocalizations l10n) {
    switch (theme) {
      case AdaptiveThemeMode.light:
        return l10n.lightTheme;
      case AdaptiveThemeMode.dark:
        return l10n.darkTheme;
      case AdaptiveThemeMode.system:
        return l10n.systemTheme;
    }
  }
}
