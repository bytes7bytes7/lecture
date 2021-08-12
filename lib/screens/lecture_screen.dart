import 'package:flutter/material.dart';
import 'package:lecture/custom/custom_route_builder.dart';
import 'package:lecture/screens/author_screen.dart';

import '../widgets/default_app_bar.dart';
import '../widgets/sized_icon_button.dart';
import '../models/lecture.dart';
import '../constants.dart';
import '../custom/always_bouncing_scroll_physics.dart';

class LectureScreen extends StatelessWidget {
  const LectureScreen({
    Key? key,
    required this.lecture,
  }) : super(key: key);

  final Lecture lecture;

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> ratingNotifier = ValueNotifier(0);
    return Scaffold(
      appBar: DefaultAppBar(
        prefix: Icons.arrow_back,
        prefixMessage: ConstantMessages.back,
        prefixOnPressed: () {
          Navigator.pop(context);
        },
        text: 'Лекция',
        suffix: Icons.more_vert,
        suffixMessage: ConstantMessages.additional,
        suffixOnPressed: () {
          showMenu(
            context: context,
            position: const RelativeRect.fromLTRB(25.1, 100.0, 25.0, 0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            items: [
              PopupMenuItem(
                value: 0,
                child: Row(
                  children: [
                    Icon(
                      Icons.bookmark_border,
                      color: Theme.of(context).primaryColor,
                      size: 24.0,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'В закладки',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
                onTap: () {},
              ),
              PopupMenuItem(
                value: 1,
                child: Row(
                  children: [
                    Icon(
                      Icons.person_outline,
                      color: Theme.of(context).primaryColor,
                      size: 24.0,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'К автору',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
                onTap: () {},
              ),
            ],
          ).then((value) {
            switch (value) {
              case 0:
                break;
              case 1:
                Navigator.of(context)
                    .push(CustomRouteBuilder(widget: const AuthorScreen()));
                break;
            }
          });
        },
      ),
      body: SingleChildScrollView(
        physics: const AlwaysBouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
          child: Column(
            children: [
              _LectureHead(lecture: lecture),
              Divider(
                height: 20,
                color: Theme.of(context).hintColor,
                thickness: 1.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Text(
                  lecture.topic,
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
              Text(
                lecture.content['text'] * 40,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, bottom: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        endIndent: 15.0,
                        color: Theme.of(context).hintColor,
                        thickness: 1.0,
                      ),
                    ),
                    Text(
                      'Было полезно?',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(color: Theme.of(context).primaryColor),
                    ),
                    Expanded(
                      child: Divider(
                        indent: 15.0,
                        color: Theme.of(context).hintColor,
                        thickness: 1.0,
                      ),
                    ),
                  ],
                ),
              ),
              ValueListenableBuilder(
                valueListenable: ratingNotifier,
                builder: (context, int value, _) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        5,
                        (index) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 7.0),
                            child: SizedIconButton(
                              icon: (index < value)
                                  ? Icons.star
                                  : Icons.star_border,
                              message: '${index + 1}',
                              onPressed: () {
                                ratingNotifier.value = index + 1;
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LectureHead extends StatelessWidget {
  const _LectureHead({
    Key? key,
    required this.lecture,
  }) : super(key: key);

  final Lecture lecture;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Text(
                      'Лектор:',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(color: Theme.of(context).primaryColor),
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        lecture.lecturer,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                //padding: const EdgeInsets.only(left: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: (lecture.rating >= 4.0)
                      ? Theme.of(context).primaryColor.withOpacity(0.25)
                      : (lecture.rating >= 3.0)
                          ? Theme.of(context).indicatorColor.withOpacity(0.25)
                          : (lecture.rating == 0.0)
                              ? Theme.of(context).disabledColor
                              : Theme.of(context).errorColor.withOpacity(0.25),
                ),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                          left: 2.0, top: 2.0, bottom: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (lecture.rating >= 4.0)
                            ? Theme.of(context).primaryColor
                            : (lecture.rating >= 3.0)
                                ? Theme.of(context).indicatorColor
                                : (lecture.rating == 0.0)
                                    ? Theme.of(context).hintColor
                                    : Theme.of(context).errorColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Icon(
                          Icons.star,
                          color: Theme.of(context).scaffoldBackgroundColor,
                          size: 14.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: (lecture.rating == 0)
                          ? Text(
                              '0,00',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(color: Theme.of(context).hintColor),
                            )
                          : Text(
                              ((lecture.rating * 100)
                                      .round()
                                      .toString()
                                      .split('')
                                    ..insert(1, ','))
                                  .join(''),
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(
                                    color: (lecture.rating >= 4.0)
                                        ? Theme.of(context).primaryColor
                                        : (lecture.rating >= 3.0)
                                            ? Theme.of(context).indicatorColor
                                            : Theme.of(context).errorColor,
                                  ),
                            ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        ...[
          ['Предмет:', lecture.subject],
          ['Факультет:', lecture.faculty],
          ['Уровень:', lecture.level],
          ['Семестр:', lecture.semester]
        ].map((pair) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Row(
              children: [
                Text(
                  pair[0] as String,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    '${pair[1]}',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ],
            ),
          );
        }),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Row(
            children: [
              Text(
                'Автор:',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: Theme.of(context).primaryColor),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  lecture.author,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Text(
                lecture.date,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Theme.of(context).hintColor,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
