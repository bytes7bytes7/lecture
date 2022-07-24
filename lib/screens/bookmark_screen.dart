import 'package:flutter/material.dart';
import 'package:rest_client/rest_client.dart';

import '../custom/always_bouncing_scroll_physics.dart';
import '../l10n/l10n.dart';
import '../widgets/default_app_bar.dart';
import '../widgets/lecture_card.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: DefaultAppBar(
        prefix: Icons.arrow_back,
        prefixTooltip: l10n.tooltipBack,
        prefixOnPressed: () {
          Navigator.pop(context);
        },
        title: l10n.bookmarks,
      ),
      body: Center(
        child: ListView.builder(
          physics: const AlwaysBouncingScrollPhysics(),
          itemCount: 7,
          itemBuilder: (context, index) {
            return LectureCard(
              lecture: Lecture.random(),
            );
          },
        ),
      ),
    );
  }
}
