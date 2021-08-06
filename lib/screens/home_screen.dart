import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lecture/models/user.dart';
import 'package:lecture/screens/lecture_editor_screen.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../widgets/sliver_search_bar.dart';
import '../widgets/lecture_card.dart';
import '../models/lecture.dart';
import '../services/server_service.dart';
import '../bloc/lecture_bloc.dart';
import '../global_parameters.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RefreshController _refreshController = RefreshController();
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: StreamBuilder(
            stream: LectureBloc.lecture,
            initialData: LectureInitState(),
            builder: (context, snapshot) {
              LectureDataState? state;
              if (snapshot.data is LectureInitState) {
                if (GlobalParameters.semesters == 0) {
                  ServerService.getFilterData();
                }
                LectureBloc.updateAllLectures();
              } else if (snapshot.data is LectureDataState) {
                state = snapshot.data as LectureDataState;
                // TODO: does not work
                _refreshController.refreshCompleted();
              }
              return SmartRefresher(
                controller: _refreshController,
                onRefresh: () {
                  LectureBloc.updateAllLectures();
                },
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    const SliverSearchBar(),
                    if (state != null)
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            return LectureCard(lecture: state!.lectures[index]);
                          },
                          childCount: state.lectures.length,
                        ),
                      )
                    else
                      SliverToBoxAdapter(
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            'Загрузка...',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Theme.of(context).focusColor,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return const LectureEditorScreen();
          }));
          // var randInst = Random();
          // String day = randInst.nextInt(29).toString();
          // String month = randInst.nextInt(13).toString();
          // String year = (randInst.nextInt(5) + 2015).toString();
          // if (day.length < 2) {
          //   day = '0' + day;
          // }
          // if (month.length < 2) {
          //   month = '0' + month;
          // }
          // String faculty = GlobalParameters
          //     .faculties[randInst.nextInt(GlobalParameters.faculties.length)];
          // String level = GlobalParameters
          //     .levels[randInst.nextInt(GlobalParameters.levels.length)];
          // String subject = GlobalParameters
          //     .subjects[randInst.nextInt(GlobalParameters.subjects.length)];
          // int semester = randInst.nextInt(GlobalParameters.semesters + 1);
          // const _chars = 'йцукенгшщзхъфывапролджэячсмитьбю';
          // String getRandomString(int length) {
          //   return String.fromCharCodes(
          //     Iterable.generate(
          //       length,
          //       (_) => _chars.codeUnitAt(randInst.nextInt(_chars.length)),
          //     ),
          //   );
          // }
          //
          // String topic = getRandomString(randInst.nextInt(15));
          // String content = getRandomString(randInst.nextInt(100) + 50);
          // String lecturer =
          //     '${getRandomString(10)} ${getRandomString(1)}.${getRandomString(1)}.';
          // String author =
          //     '${getRandomString(10)} ${getRandomString(1)}.${getRandomString(1)}.';
          // double rating = randInst.nextInt(5) + randInst.nextDouble();
          // LectureBloc.uploadLecture(Lecture(
          //   faculty: faculty,
          //   level: level,
          //   subject: subject,
          //   semester: semester,
          //   topic: topic,
          //   content: content,
          //   lecturer: lecturer,
          //   date: '$day.$month.$year',
          //   rating: rating,
          //   author: User(
          //     id: 'abc123',
          //     firstName: author,
          //     lastName: author,
          //   ),
          // ));
        },
      ),
    );
  }
}
