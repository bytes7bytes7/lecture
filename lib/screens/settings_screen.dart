import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tuple/tuple.dart';

import '../constants/measures.dart' as const_measures;
import '../features/common/common.dart';
import '../l10n/l10n.dart';
import '../routes.dart';
import '../scope/app_scope.dart';
import '../widgets/widgets.dart';

const _bodyPadding = EdgeInsets.symmetric(
  vertical: 15.0,
  horizontal: const_measures.mainHorMargin,
);
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
        prefixConfig: AppBarButtonConfig(
          icon: Icons.arrow_back,
          tooltip: l10n.tooltipBack,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: user.beautifulID,
        canCopyTitle: true,
        suffixConfig: AppBarButtonConfig(
          icon: Icons.exit_to_app,
          tooltip: l10n.tooltipLogOut,
          onPressed: () {
            showQuestionBottomOverlay(
              context: context,
              text: l10n.logOutAskAgain,
              secondary: l10n.cancelBtn,
              secondaryOnPressed: () {
                Navigator.pop(context);
              },
              primary: l10n.logOut,
              primaryOnPressed: () {
                ref.read(AppScope.get().loggerManager).log('log out');
                // TODO: call logOut via controller
                ref.read(AppScope.get().authRepo).logOut();
              },
            );
          },
        ),
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
                    ...<Tuple4<IconData, String, VoidCallback, List<Widget>>>[
                      Tuple4(
                        Icons.person,
                        l10n.accountTitle,
                        () => _openAccount(context),
                        const [],
                      ),
                      Tuple4(
                        Icons.brightness_6_rounded,
                        l10n.colorThemeTitle,
                        () => _openColorTheme(context),
                        const [],
                      ),
                      Tuple4(
                        Icons.bookmark,
                        l10n.bookmarks,
                        () => _openBookmarks(context),
                        [
                          if (user.bookmarks?.isNotEmpty == true)
                            Badge(value: '${user.bookmarks?.length}'),
                        ],
                      ),
                      Tuple4(
                        Icons.insert_drive_file,
                        l10n.myLectures,
                        () => _openMyLectures(context),
                        [
                          const Badge(value: '$_my'),
                        ],
                      ),
                    ].map((e) {
                      return LineButton(
                        icon: e.item1,
                        text: e.item2,
                        onPressed: e.item3,
                        actions: e.item4,
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
    AccountRoute().go(context);
  }

  void _openColorTheme(BuildContext context) {
    ThemeRoute().go(context);
  }

  void _openBookmarks(BuildContext context) {
    BookmarksRoute().go(context);
  }

  void _openMyLectures(BuildContext context) {
    MyLecturesRoute().go(context);
  }

  void _openAboutApp(BuildContext context) {
    AboutAppRoute().go(context);
  }
}
