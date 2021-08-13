import 'package:flutter/material.dart';

import '../models/lecture.dart';
import '../widgets/lecture_card.dart';
import '../custom/always_bouncing_scroll_physics.dart';
import '../widgets/default_app_bar.dart';
import '../constants.dart';

class MyLecturesScreen extends StatelessWidget {
  const MyLecturesScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        prefix: Icons.arrow_back,
        prefixMessage: ConstantMessages.back,
        prefixOnPressed: () {
          Navigator.pop(context);
        },
        text: 'Мои лекции',
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: TabBar(
                isScrollable: true,
                labelStyle: Theme.of(context).textTheme.subtitle1,
                labelColor: Theme.of(context).primaryColor,
                unselectedLabelColor: Theme.of(context).hintColor,
                indicatorColor: Colors.transparent,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                tabs: [
                  Tab(
                    text: "Опубликовано 1",
                    height: Theme.of(context).textTheme.subtitle1!.fontSize! * 2,
                  ),
                  Tab(
                    text: "Черновики 2",
                    height: Theme.of(context).textTheme.subtitle1!.fontSize! * 2,
                  ),
                ],
              ),
            ),
            Divider(
              color: Theme.of(context).hintColor,
              indent: 25.0,
              endIndent: 25.0,
              thickness: 1.0,
            ),
            Flexible(
              child: TabBarView(
                physics: const BouncingScrollPhysics(),
                children: [
                  ListView.builder(
                    physics: const AlwaysBouncingScrollPhysics(),
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return LectureCard(lecture: Lecture.random());
                    },
                  ),
                  ListView.builder(
                    physics: const AlwaysBouncingScrollPhysics(),
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return LectureCard(lecture: Lecture.random(isPublished: false));
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
