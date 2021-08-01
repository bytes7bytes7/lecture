import 'package:flutter/material.dart';

import '../widgets/sliver_search_bar.dart';
import '../widgets/lecture_card.dart';
import '../test_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: add pull_to_refresh package
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              const SliverSearchBar(),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return LectureCard(lecture: TestData.testLectures[index]);
                  },
                  childCount: TestData.testLectures.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

