import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lecture/constants.dart';
import 'package:lecture/models/lecture.dart';

import '../widgets/sized_icon_button.dart';
import '../custom/custom_route_builder.dart';
import '../widgets/error_label.dart';
import '../custom/always_bouncing_scroll_physics.dart';
import '../widgets/lecture_card.dart';
import '../widgets/subject_list_view.dart';
import '../widgets/home_search_bar.dart';
import '../services/server_service.dart';
import '../bloc/lecture_bloc.dart';
import '../global_parameters.dart';
import 'lecture_editor_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          automaticallyImplyLeading: false,
          titleSpacing: 25.0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedIconButton(
                icon: Icons.sort,
                message: ConstantMessages.settings,
                onPressed: () {
                  Navigator.of(context).push(
                    CustomRouteBuilder(
                      widget: const SettingsScreen(),
                      begin: const Offset(-1, 0),
                      end: const Offset(0, 0),
                    ),
                  );
                },
              ),
              Text(
                'Лекция',
                style: Theme.of(context).textTheme.headline1,
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(4),
                width: 36.0,
                height: 36.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(7.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.0),
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    child: Image.network(
                      'https://www.topsunglasses.net/wp-content/uploads/2016/10/Polarized-Sunglasses-for-Men-Photos.jpg',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () => LectureBloc.updateAllLectures(),
          color: Theme.of(context).primaryColor,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          triggerMode: RefreshIndicatorTriggerMode.anywhere,
          child: StreamBuilder(
            stream: LectureBloc.lecture,
            initialData: LectureInitState(),
            builder: (context, snapshot) {
              if (snapshot.data is LectureInitState) {
                if (GlobalParameters.semesters == 0) {
                  ServerService.getFilterData();
                }
                LectureBloc.updateAllLectures();
                return const SizedBox.shrink();
              } else if (snapshot.data is LectureLoadingState) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                    strokeWidth: 2.0,
                  ),
                );
              } else if (snapshot.data is LectureDataState) {
                LectureDataState state = snapshot.data as LectureDataState;
                return ListView.builder(
                  physics: const AlwaysBouncingScrollPhysics(),
                  itemCount: state.lectures.length + 1,
                  itemBuilder: (context, index) {
                    switch (index) {
                      case 0:
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(
                                top: 20.0,
                                bottom: 15.0,
                              ),
                              child: HomeSearchBar(),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 25.0, vertical: 15.0),
                              child: Text(
                                'Предметы',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            ),
                            const SubjectListView(),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 25.0, top: 15.0, bottom: 5),
                              child: Text(
                                'Новое',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            ),
                            if (state.lectures.isEmpty)
                              Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Text(
                                  'Пусто',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                          ],
                        );
                      default:
                        return LectureCard(
                          lecture: state.lectures[index - 1],
                        );
                    }
                  },
                );
              } else {
                return const ErrorLabel();
              }
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: 'Новая лекция',
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(
            Icons.note_add,
            color: Theme.of(context).scaffoldBackgroundColor,
            size: 24.0,
          ),
          onPressed: () {
            var rand = Random();
            const _chars = 'йцукенгшщзхъфывапролджэячсмитьбю ';
            String getRandomString(int length) =>
                String.fromCharCodes(Iterable.generate(length,
                    (_) => _chars.codeUnitAt(rand.nextInt(_chars.length))));
            String faculty = GlobalParameters
                .faculties[rand.nextInt(GlobalParameters.faculties.length)];
            String level = GlobalParameters
                .levels[rand.nextInt(GlobalParameters.levels.length)];
            String subject = GlobalParameters
                .subjects[rand.nextInt(GlobalParameters.subjects.length)];
            int semester = rand.nextInt(GlobalParameters.semesters) + 1;
            String topic = getRandomString(rand.nextInt(10) + 10);
            String content = getRandomString(rand.nextInt(50) + 50);
            String lecturer =
                '${getRandomString(rand.nextInt(7) + 7)} ${getRandomString(1)}.${getRandomString(1)}';
            int year = rand.nextInt(5)+2015;
            int month = rand.nextInt(12)+1;
            int day = rand.nextInt(28)+1;
            double rating = rand.nextInt(4) + rand.nextDouble() + 1;
            String author =
                '${getRandomString(rand.nextInt(7) + 7)} ${getRandomString(1)}.${getRandomString(1)}';
            LectureBloc.uploadLecture(Lecture(
              faculty: faculty,
              level: level,
              subject: subject,
              semester: semester,
              topic: topic,
              content: content,
              lecturer: lecturer,
              date: '$day.$month.$year',
              rating: rating,
              author: author,
            ));
            // TODO: uncomment this code
            // Navigator.of(context).push(
            //   CustomRouteBuilder(widget: const LectureEditorScreen()),
            // );
          },
        ),
      ),
    );
  }
}
