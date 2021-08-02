import 'package:flutter/material.dart';
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
          LectureBloc.uploadLecture(Lecture(
            subject: 'Информатика',
            topic: 'Абстрактные классы',
            content:
            'Абстрактный класс в объектно-ориентированном программировании — базовый класс, который не предполагает создания экземпляров. Абстрактные классы реализуют на практике один из принципов ООП — полиморфизм. Абстрактный класс может содержать (и не содержать[1]) абстрактные методы и свойства. Абстрактный метод не реализуется для класса, в котором описан, однако должен быть реализован для его неабстрактных потомков. Абстрактные классы представляют собой наиболее общие абстракции, то есть имеющие наибольший объём и наименьшее содержание.',
            lecturer: 'Куликова Н.Н.',
            date: '13.05.21',
            rating: 4.47,
            author: 'Петрова А.Д.',
          ));
        },
      ),
    );
  }
}
