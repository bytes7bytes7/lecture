import 'package:flutter/material.dart';
import 'package:rest_client/rest_client.dart';

import '../constants/measures.dart' as const_measures;
import '../custom/always_bouncing_scroll_physics.dart';
import '../l10n/l10n.dart';
import '../widgets/default_app_bar.dart';
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
        prefix: Icons.arrow_back,
        prefixTooltip: l10n.tooltipBack,
        prefixOnPressed: () {
          Navigator.pop(context);
        },
        title: l10n.myLectures,
      ),
      body: DefaultTabController(
        length: _tabAmount,
        child: Column(
          children: [
            TabBar(
              isScrollable: true,
              labelStyle: theme.textTheme.subtitle1,
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
                      return LectureCard(
                        lecture: Lecture.random(),
                      );
                    },
                  ),
                  ListView.builder(
                    key: _draftListKey,
                    physics: const AlwaysBouncingScrollPhysics(),
                    itemCount: _drafts,
                    itemBuilder: (context, index) {
                      return LectureCard(
                        key: ValueKey('${_draftListKey.value}/index'),
                        lecture: Lecture.random(isPublished: false),
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
