import 'package:flutter/material.dart';
import 'package:lecture/custom/always_bouncing_scroll_physics.dart';

import '../models/lecture.dart';
import '../widgets/lecture_card.dart';
import '../constants.dart';
import '../widgets/default_app_bar.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({
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
        text: 'Сохраненное',
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
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
      ),
    );
  }
}
