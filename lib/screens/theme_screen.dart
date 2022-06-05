import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

import '../constants/db.dart' as const_db;
import '../constants/tooltips.dart' as const_tooltips;
import '../global_parameters.dart';
import '../widgets/default_app_bar.dart';
import '../widgets/line_button.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({
    Key? key,
  }) : super(key: key);

  void changeTheme({required BuildContext context, required String value}) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        prefix: Icons.arrow_back,
        prefixMessage: const_tooltips.back,
        prefixOnPressed: () {
          Navigator.pop(context);
        },
        text: 'Тема',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 20.0),
            child: Text(
              'Выберите цветовую тему приложения',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          ValueListenableBuilder(
            valueListenable: GlobalParameters.themeNotifier,
            builder: (context, String value, _) {
              return Column(
                children: ['Светлая', '', 'Темная', '', 'Системная']
                    .map<Widget>((title) {
                  if (title.isEmpty) {
                    return Divider(
                      color: Theme.of(context).hintColor,
                      thickness: 1.0,
                      indent: 25.0,
                      endIndent: 25.0,
                      height: 1,
                    );
                  } else {
                    return LineButton(
                      text: title,
                      onPressed: () {
                        if (value != title) {
                          GlobalParameters.themeNotifier.value = title;
                          changeTheme(context: context, value: title);
                        }
                      },
                      actions: [
                        Icon(
                          (title == value)
                              ? Icons.radio_button_on
                              : Icons.radio_button_off,
                          color: Theme.of(context).primaryColor,
                          size: 24.0,
                        ),
                      ],
                    );
                  }
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
