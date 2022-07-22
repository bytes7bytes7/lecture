import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rest_client/rest_client.dart';

import '../constants/app.dart' as const_app;
import '../constants/routes.dart' as const_routes;
import '../constants/tooltips.dart' as const_tooltips;
import '../custom/always_bouncing_scroll_physics.dart';
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
          prefixTooltip: const_tooltips.settings,
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
                                const SectionTitle(
                                  title: 'Предметы',
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
                                const SectionTitle(
                                  title: 'Новое',
                                ),
                              ] else
                                const SectionTitle(
                                  title: 'Результаты поиска',
                                ),
                              if (data.isEmpty)
                                Container(
                                  alignment: Alignment.center,
                                  padding: _emptyBoxPadding,
                                  child: Text(
                                    'Пусто 😢',
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
          tooltip: const_tooltips.newLecture,
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
    return (ref.watch(AppScope.get().isFilterUpdated))
        ? SingleButton(
            text: 'Обновить',
            onPressed: ref.read(AppScope.get().filter.notifier).updateFilter,
          )
        : const SizedBox.shrink();
  }
}
