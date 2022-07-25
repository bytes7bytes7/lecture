import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rest_client/rest_client.dart';

import '../constants/app.dart' as const_app;
import '../constants/routes.dart' as const_routes;
import '../custom/always_bouncing_scroll_physics.dart';
import '../l10n/l10n.dart';
import '../scope/app_scope.dart';
import '../widgets/widgets.dart';

const _floatButtonSize = 24.0;
const _emptyBoxPadding = EdgeInsets.only(top: 60.0);

class HomeScreen extends ConsumerWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    ref.read(AppScope.get().loggerManager).log(theme.scaffoldBackgroundColor);

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: theme.scaffoldBackgroundColor,
      ),
    );

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: DefaultAppBar(
          title: const_app.appName,
          titleStyle: theme.textTheme.headline1,
          prefix: Icons.sort,
          prefixTooltip: l10n.tooltipSettings,
          prefixOnPressed: () {
            Navigator.of(context).pushNamed(const_routes.settings);
          },
        ),
        body: RefreshIndicator(
          onRefresh: () => _onRefresh(ref),
          color: theme.primaryColor,
          backgroundColor: theme.scaffoldBackgroundColor,
          triggerMode: RefreshIndicatorTriggerMode.anywhere,
          child: StreamBuilder<List<Lecture>>(
            builder: (context, snapshot) {
              ref.read(AppScope.get().loggerManager)
                ..info('getFilterData')
                ..log('updateAllLectures');
              if (snapshot.hasError) {
                return LayoutBuilder(
                  builder: (context, constraints) {
                    return ListView(
                      physics: const AlwaysBouncingScrollPhysics(),
                      children: [
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: constraints.maxHeight,
                          ),
                          child: ErrorLabel(
                            topWidget: const HomeSearchBar(),
                            tryAgain: () async {
                              ref
                                  .read(AppScope.get().loggerManager)
                                  .log('updateAllLectures');
                            },
                          ),
                        ),
                      ],
                    );
                  },
                );
              }

              final data = snapshot.data;
              if (data == null) {
                return const LoadingCircle();
              } else {
                return Stack(
                  children: [
                    ListView.builder(
                      physics: const AlwaysBouncingScrollPhysics(),
                      itemCount: data.length + 1,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const HomeSearchBar(),
                              if (ref
                                  .read(AppScope.get().filter.notifier)
                                  .isFilterEmpty) ...[
                                SectionTitle(
                                  title: l10n.subjects,
                                ),
                                SubjectListView(
                                  items: [
                                    Subject(
                                      title: 'Мат. Анализ',
                                      url: 'assets/images/subjects/math.png',
                                    ),
                                    Subject(
                                      title: 'Русс. язык',
                                      url: 'assets/images/subjects/russian.png',
                                    ),
                                    Subject(
                                      title: 'Основы программ-я на C/C++',
                                      url: 'assets/images/subjects/coding.png',
                                    ),
                                  ],
                                ),
                                SectionTitle(
                                  title: l10n.newLectures,
                                ),
                              ] else
                                SectionTitle(
                                  title: l10n.searchResult,
                                ),
                              if (data.isEmpty)
                                Container(
                                  alignment: Alignment.center,
                                  padding: _emptyBoxPadding,
                                  child: Text(
                                    l10n.empty,
                                    style: theme.textTheme.bodyText1,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                            ],
                          );
                        }

                        return LectureCard(
                          lecture: data[index - 1],
                        );
                      },
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: _RefreshButton(),
                    ),
                  ],
                );
              }
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: l10n.tooltipNewLecture,
          backgroundColor: theme.primaryColor,
          child: Icon(
            Icons.note_add,
            color: theme.scaffoldBackgroundColor,
            size: _floatButtonSize,
          ),
          onPressed: () {
            Navigator.of(context).pushNamed(const_routes.editor);
          },
        ),
      ),
    );
  }

  Future<void> _onRefresh(WidgetRef ref) async {
    final r = await ref.read(AppScope.get().lectureRepo).getLectures(null);

    ref.read(AppScope.get().loggerManager).log('_onRefresh');

    return;
  }
}

class _RefreshButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    return (ref.watch(AppScope.get().isFilterUpdated))
        ? SingleButton(
            text: l10n.refresh,
            onPressed: ref.read(AppScope.get().filter.notifier).updateFilter,
          )
        : const SizedBox.shrink();
  }
}
