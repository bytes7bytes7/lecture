import 'package:flutter/material.dart';
import 'package:rest_client/rest_client.dart';

import '../constants/tooltips.dart' as const_tooltips;
import '../custom/always_bouncing_scroll_physics.dart';
import '../widgets/default_app_bar.dart';
import '../widgets/lecture_card.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        prefix: Icons.arrow_back,
        prefixTooltip: const_tooltips.back,
        prefixOnPressed: () {
          Navigator.pop(context);
        },
        title: 'Сохраненное',
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
