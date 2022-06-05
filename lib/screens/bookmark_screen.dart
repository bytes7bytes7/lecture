import 'package:flutter/material.dart';

import '../constants/tooltips.dart' as const_tooltips;
import '../custom/always_bouncing_scroll_physics.dart';
import '../models/lecture.dart';
import '../widgets/default_app_bar.dart';
import '../widgets/lecture_card.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        prefix: Icons.arrow_back,
        prefixMessage: const_tooltips.back,
        prefixOnPressed: () {
          Navigator.pop(context);
        },
        text: 'Сохраненное',
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
