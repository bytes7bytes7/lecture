import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rest_client/rest_client.dart';

import '../constants/measures.dart' as const_measures;
import '../constants/routes.dart' as const_routes;
import '../global_parameters.dart';
import '../l10n/l10n.dart';
import '../overlays/show_bottom_overlay.dart';
import '../scope/app_scope.dart';
import '../utils/quadruple.dart';
import '../widgets/widgets.dart';

const _me = User(
  id: 7776660,
  firstName: 'Владимир',
  lastName: 'Соколов',
  email: 'vladimir.sokolov@mail.ru',
  token: 'TEST_TOKEN',
  avatar: 'https://www.topsunglasses.net/wp-content/uploads/'
      '2016/10/Polarized-Sunglasses-for-Men-Photos.jpg',
);
const _bodyPadding = EdgeInsets.symmetric(vertical: 15.0);
const _bookmarks = 7;
const _my = 3;

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return Scaffold(
      appBar: DefaultAppBar(
        prefix: Icons.arrow_back,
        prefixTooltip: l10n.tooltipBack,
        prefixOnPressed: () {
          Navigator.pop(context);
        },
        title: _me.beautifulID,
        suffix: Icons.exit_to_app,
        suffixTooltip: l10n.tooltipLogOut,
        suffixOnPressed: () {
          showBottomOverlay(
            context: context,
            secondary: 'Отмена',
            secondaryOnPressed: () {
              Navigator.pop(context);
            },
            primary: 'Выйти',
            primaryOnPressed: () {
              GlobalParameters.setOverlayConfigToDefault();
              Navigator.of(context).popUntil((route) => route.isFirst);
              Navigator.of(context).pushReplacementNamed(const_routes.auth);
            },
            textSpans: [
              const TextSpan(
                text: '😐\n\n',
                style: TextStyle(
                  fontSize: const_measures.emojiSize,
                ),
              ),
              TextSpan(
                text: 'Вы действительно хотите ',
                style: theme.textTheme.bodyText1,
              ),
              TextSpan(
                text: 'выйти ',
                style: theme.textTheme.subtitle1
                    ?.copyWith(color: theme.errorColor),
              ),
              TextSpan(
                text: 'из учетной записи?',
                style: theme.textTheme.bodyText1,
              ),
            ],
          );
        },
      ),
      body: Center(
        child: Column(
          children: [
            const UserHeader(
              user: _me,
            ),
            Expanded(
              child: Padding(
                padding: _bodyPadding,
                child: Column(
                  children: [
                    ...<
                        Quadruple<IconData, String, VoidCallback,
                            List<Widget>>>[
                      Quadruple(
                        first: Icons.person,
                        second: 'Аккаунт',
                        third: () {
                          ref
                              .read(AppScope.get().loggerManager)
                              .info('Аккаунт');
                        },
                      ),
                      Quadruple(
                        first: Icons.brightness_6_rounded,
                        second: 'Тема приложения',
                        third: () {
                          Navigator.of(context).pushNamed(const_routes.theme);
                        },
                      ),
                      Quadruple(
                        first: Icons.bookmark,
                        second: 'Сохраненное',
                        third: () {
                          Navigator.of(context)
                              .pushNamed(const_routes.bookmark);
                        },
                        fourth: [
                          const Badge(value: '$_bookmarks'),
                        ],
                      ),
                      Quadruple(
                        first: Icons.insert_drive_file,
                        second: 'Мои лекции',
                        third: () {
                          Navigator.of(context)
                              .pushNamed(const_routes.myLectures);
                        },
                        fourth: [
                          const Badge(value: '$_my'),
                        ],
                      ),
                    ].map((quad) {
                      return LineButton(
                        icon: quad.first,
                        text: '${quad.second}',
                        onPressed: quad.third ?? () {},
                        actions: quad.fourth ?? [],
                        borderType: LineBorderType.bottom,
                      );
                    }),
                    const Spacer(),
                    LineButton(
                      icon: Icons.info,
                      text: 'О приложении',
                      onPressed: () {
                        ref
                            .read(AppScope.get().loggerManager)
                            .info('О приложении');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
