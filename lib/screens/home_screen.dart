import 'package:flutter/material.dart';
import 'package:lecture/global_parameters.dart';
import 'package:lecture/services/server_service.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../bloc/lecture_bloc.dart';
import '../widgets/sliver_search_bar.dart';
import '../widgets/lecture_card.dart';

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
                if(GlobalParameters.semesters == 0){
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
    );
  }
}
