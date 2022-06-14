import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quick_quotes_quill/spread_quill_manager.dart';
import 'package:rest_client/rest_client.dart';

import '../bloc/lecture_bloc.dart';
import '../constants/app.dart' as const_app;
import '../constants/routes.dart' as const_routes;
import '../constants/tooltips.dart' as const_tooltips;
import '../custom/always_bouncing_scroll_physics.dart';
import '../global_parameters.dart';
import '../widgets/widgets.dart';

const _floatButtonSize = 24.0;
const _emptyBoxPadding = EdgeInsets.only(top: 60.0);

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          onRefresh: LectureBloc.updateAllLectures,
          color: theme.primaryColor,
          backgroundColor: theme.scaffoldBackgroundColor,
          triggerMode: RefreshIndicatorTriggerMode.anywhere,
          child: StreamBuilder(
            stream: LectureBloc.lecture,
            initialData: LectureInitState(),
            builder: (context, snapshot) {
              final state = snapshot.data;
              if (state is LectureInitState) {
                if (GlobalParameters.semesters == 0) {
                  SpreadQuillManager.inst.info('getFilterData');
                }
                LectureBloc.updateAllLectures();
                return const SizedBox.shrink();
              } else if (state is LectureLoadingState) {
                return const LoadingCircle();
              } else if (state is LectureDataState) {
                return Stack(
                  children: [
                    ListView.builder(
                      physics: const AlwaysBouncingScrollPhysics(),
                      itemCount: state.lectures.length + 1,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const HomeSearchBar(),
                              if (GlobalParameters.isFilterEmpty() &&
                                  !GlobalParameters.isFilterChanged.value) ...[
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
                              if (state.lectures.isEmpty)
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
                          lecture: state.lectures[index - 1],
                        );
                      },
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: ValueListenableBuilder(
                        valueListenable: GlobalParameters.isFilterChanged,
                        builder: (context, bool value, _) {
                          if (!value) {
                            return const SizedBox.shrink();
                          } else {
                            return const SingleButton(
                              text: 'Обновить',
                              onPressed: GlobalParameters.updateFiler,
                            );
                          }
                        },
                      ),
                    ),
                  ],
                );
              } else {
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
                              await LectureBloc.updateAllLectures();
                            },
                          ),
                        ),
                      ],
                    );
                  },
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
}
