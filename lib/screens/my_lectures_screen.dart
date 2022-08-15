import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '../constants/measures.dart' as const_measures;
import '../features/common/common.dart';
import '../l10n/l10n.dart';
import '../routes.dart';
import '../widgets/lecture_card.dart';

const _tabAmount = 2;
const _published = 43;
const _drafts = 4325;
const _indent = 25.0;
const _thickness = 1.0;
const _publishedListKey = PageStorageKey('MyLecturesScreen/published');
const _draftListKey = PageStorageKey('MyLecturesScreen/draft');

class MyLecturesScreen extends StatelessWidget {
  const MyLecturesScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return Scaffold(
      appBar: DefaultAppBar(
        prefixConfig: AppBarButtonConfig(
          icon: Icons.arrow_back,
          tooltip: l10n.tooltipBack,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: l10n.myLectures,
      ),
      body: DefaultTabController(
        length: _tabAmount,
        child: Column(
          children: [
            TabBar(
              isScrollable: true,
              labelStyle: theme.textTheme.bodyText2,
              labelColor: theme.primaryColor,
              unselectedLabelColor: theme.hintColor,
              indicatorColor: Colors.transparent,
              tabs: [
                Tab(
                  text: l10n.lecturesPublished(_numBoundary(_published, l10n)),
                ),
                Tab(
                  text: l10n.amountOfDrafts(_numBoundary(_drafts, l10n)),
                ),
              ],
            ),
            Divider(
              color: theme.hintColor,
              indent: _indent,
              endIndent: _indent,
              thickness: _thickness,
            ),
            Flexible(
              child: TabBarView(
                physics: const BouncingScrollPhysics(),
                children: [
                  ListView.builder(
                    key: _publishedListKey,
                    physics: const AlwaysBouncingScrollPhysics(),
                    itemCount: _published,
                    itemBuilder: (context, index) {
                      final lecture = Lecture.random();

                      return LectureCard(
                        lecture: lecture,
                        onPressed: () {
                          MyLectureRoute(lid: lecture.id).go(context);
                        },
                      );
                    },
                  ),
                  ListView.builder(
                    key: _draftListKey,
                    physics: const AlwaysBouncingScrollPhysics(),
                    itemCount: _drafts,
                    itemBuilder: (context, index) {
                      final lecture = Lecture.random(
                        isPublished: false,
                      );

                      return LectureCard(
                        lecture: lecture,
                        onPressed: () {
                          MyLectureRoute(lid: lecture.id).go(context);
                        },
                      );
                    },
                    itemExtent: const_measures.cardHeight +
                        const_measures.mainVerMargin * 2,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  String _numBoundary(int amount, AppLocalizations l10n) {
    if (amount >= 100) {
      return l10n.moreThan99;
    }

    return '$amount';
  }
}
