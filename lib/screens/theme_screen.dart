import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

import '../constants/db.dart' as const_db;
import '../constants/measures.dart' as const_measures;
import '../global_parameters.dart';
import '../l10n/l10n.dart';
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
        title: 'Тема',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: _padding,
            child: Text(
              'Выберите цветовую тему приложения',
              style: theme.textTheme.subtitle1,
            ),
          ),
          ValueListenableBuilder<String>(
            valueListenable: GlobalParameters.themeNotifier,
            builder: (context, value, child) {
              return Column(
                children: const_db.themes.map((title) {
                  return LineButton(
                    text: title,
                    borderType: LineBorderType.bottom,
                    onPressed: () {
                      if (value != title) {
                        GlobalParameters.themeNotifier.value = title;
                        _changeTheme(context, title);
                      }
                    },
                    actions: [
                      Icon(
                        (title == value)
                            ? Icons.radio_button_on
                            : Icons.radio_button_off,
                        color: theme.primaryColor,
                        size: const_measures.smallIconSize,
                      ),
                    ],
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }

  void _changeTheme(BuildContext context, String value) {
    switch (value) {
      case const_db.lightThemeValue:
        AdaptiveTheme.of(context).setLight();
        break;
      case const_db.darkThemeValue:
        AdaptiveTheme.of(context).setDark();
        break;
      case const_db.systemThemeValue:
        AdaptiveTheme.of(context).setSystem();
        break;
    }
  }
}
