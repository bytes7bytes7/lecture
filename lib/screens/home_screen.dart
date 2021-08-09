import 'package:flutter/material.dart';

import '../widgets/subject_list_view.dart';
import '../widgets/home_search_bar.dart';
import '../widgets/leading_icon_button.dart';
import '../widgets/sliver_search_bar.dart';
import '../widgets/lecture_card.dart';
import '../services/server_service.dart';
import '../bloc/lecture_bloc.dart';
import '../global_parameters.dart';
import 'lecture_editor_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        // TODO: fix appbar padding
        titleSpacing: 20.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LeadingIconButton(
              icon: Icons.sort,
              color: Theme.of(context).primaryColor,
              onPressed: () {},
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
              //color: Colors.green,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7.0),
                child: Image.network(
                  'https://www.topsunglasses.net/wp-content/uploads/2016/10/Polarized-Sunglasses-for-Men-Photos.jpg',
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HomeSearchBar(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'Предметы',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          SubjectListView(),
        ],
      ),
    );
  }
}

//
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     RefreshController _refreshController = RefreshController();
//     return Scaffold(
//       body: SafeArea(
//         child: GestureDetector(
//           behavior: HitTestBehavior.translucent,
//           onTap: () {
//             FocusScope.of(context).requestFocus(FocusNode());
//           },
//           child: StreamBuilder(
//             stream: LectureBloc.lecture,
//             initialData: LectureInitState(),
//             builder: (context, snapshot) {
//               LectureDataState? state;
//               if (snapshot.data is LectureInitState) {
//                 if (GlobalParameters.semesters == 0) {
//                   ServerService.getFilterData();
//                 }
//                 LectureBloc.updateAllLectures();
//               } else if (snapshot.data is LectureDataState) {
//                 state = snapshot.data as LectureDataState;
//                 // TODO: does not work
//                 _refreshController.refreshCompleted();
//                 return RefreshIndicator(child: SizedBox(), onRefresh: () {});
//               }
//               return SmartRefresher(
//                 controller: _refreshController,
//                 onRefresh: () {
//                   LectureBloc.updateAllLectures();
//                 },
//                 child: CustomScrollView(
//                   physics: const BouncingScrollPhysics(),
//                   slivers: [
//                     const SliverSearchBar(),
//                     if (state != null)
//                       SliverList(
//                         delegate: SliverChildBuilderDelegate(
//                           (BuildContext context, int index) {
//                             return LectureCard(lecture: state!.lectures[index]);
//                           },
//                           childCount: state.lectures.length,
//                         ),
//                       )
//                     else
//                       SliverToBoxAdapter(
//                         child: Container(
//                           alignment: Alignment.center,
//                           padding: const EdgeInsets.symmetric(vertical: 20),
//                           child: Text(
//                             'Загрузка...',
//                             style: Theme.of(context).textTheme.bodyText1,
//                           ),
//                         ),
//                       ),
//                   ],
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(
//           Icons.add,
//           color: Theme.of(context).focusColor,
//         ),
//         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//         onPressed: () {
//           Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//             return const LectureEditorScreen();
//           }));
//         },
//       ),
//     );
//   }
// }
