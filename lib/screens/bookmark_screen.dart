import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '../constants/measures.dart' as const_measures;
import '../features/common/common.dart';
import '../l10n/l10n.dart';
import '../routes.dart';
import '../widgets/lecture_card.dart';

const _padding = EdgeInsets.only(
  top: const_measures.mainVerMargin,
);

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
        title: l10n.bookmarks,
      ),
      body: Center(
        child: Padding(
          padding: _padding,
          child: ListView.builder(
            physics: const AlwaysBouncingScrollPhysics(),
            itemCount: 7,
            itemBuilder: (context, index) {
              final lecture = Lecture.random();

              return LectureCard(
                lecture: lecture,
                onPressed: () {
                  BookmarkRoute(lid: lecture.id).go(context);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
