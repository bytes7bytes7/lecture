import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rest_client/rest_client.dart';

import '../constants/routes.dart' as const_routes;
import '../features/common/common.dart';
import '../l10n/l10n.dart';
import '../scope/app_scope.dart';
import '../widgets/widgets.dart';

const _bodyPadding = EdgeInsets.symmetric(vertical: 15.0);
const _my = 3;

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    // TODO: do NOT read Repo; read some controller instead
    final user = ref.watch(AppScope.get().authRepo).user.value;

    return Scaffold(
      appBar: DefaultAppBar(
        prefix: Icons.arrow_back,
        prefixTooltip: l10n.tooltipBack,
        prefixOnPressed: () {
          Navigator.pop(context);
        },
        title: user.beautifulID,
        canCopyTitle: true,
        suffix: Icons.exit_to_app,
        suffixTooltip: l10n.tooltipLogOut,
        suffixOnPressed: () {
          showBottomOverlay(
            context: context,
            text: l10n.logOutAskAgain,
            secondary: l10n.cancelBtn,
            secondaryOnPressed: () {
              Navigator.pop(context);
            },
            primary: l10n.logOut,
            primaryOnPressed: () {
              // TODO: call logOut
              ref.read(AppScope.get().loggerManager).log('log out');
            },
          );
        },
      ),
      body: Center(
        child: Column(
          children: [
            UserHeader(
              user: user,
            ),
            Expanded(
              child: Padding(
                padding: _bodyPadding,
                child: Column(
                  children: [
                    ...<Quartet<IconData, String, VoidCallback, List<Widget>>>[
                      Quartet(
                        Icons.person,
                        l10n.accountTitle,
                        () => _openAccount(context),
                      ),
                      Quartet(
                        Icons.brightness_6_rounded,
                        l10n.colorThemeTitle,
                        () => _openColorTheme(context),
                      ),
                      Quartet(
                        Icons.bookmark,
                        l10n.bookmarks,
                        () => _openBookmarks(context),
                        [
                          if (user.bookmarks?.isNotEmpty == true)
                            Badge(value: '${user.bookmarks?.length}'),
                        ],
                      ),
                      Quartet(
                        Icons.insert_drive_file,
                        l10n.myLectures,
                        () => _openMyLectures(context),
                        [
                          const Badge(value: '$_my'),
                        ],
                      ),
                    ].map((e) {
                      return LineButton(
                        icon: e.first,
                        text: '${e.second}',
                        onPressed: e.third ?? () {},
                        actions: e.fourth ?? [],
                        borderType: LineBorderType.bottom,
                      );
                    }),
                    const Spacer(),
                    LineButton(
                      icon: Icons.info,
                      text: l10n.aboutAppTitle,
                      onPressed: () => _openAboutApp(context),
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

  void _openAccount(BuildContext context) {
    Navigator.of(context).pushNamed(const_routes.account);
  }

  void _openColorTheme(BuildContext context) {
    Navigator.of(context).pushNamed(const_routes.theme);
  }

  void _openBookmarks(BuildContext context) {
    Navigator.of(context).pushNamed(const_routes.bookmark);
  }

  void _openMyLectures(BuildContext context) {
    Navigator.of(context).pushNamed(const_routes.myLectures);
  }

  void _openAboutApp(BuildContext context) {
    Navigator.of(context).pushNamed(const_routes.aboutApp);
  }
}
