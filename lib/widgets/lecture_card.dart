import 'package:flutter/material.dart';
import 'package:lecture/screens/lecture_screen.dart';

import '../custom/custom_route_builder.dart';
import '../models/lecture.dart';

class LectureCard extends StatelessWidget {
  const LectureCard({
    Key? key,
    required this.lecture,
  }) : super(key: key);

  final Lecture lecture;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 12.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withOpacity(0.25),
            offset: const Offset(0, 4),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: MaterialButton(
          padding: const EdgeInsets.all(12.0),
          minWidth: 0,
          onPressed: () {
            Navigator.of(context).push(CustomRouteBuilder(
              widget: LectureScreen(lecture: lecture),
            ));
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        lecture.topic,
                        style: Theme.of(context).textTheme.subtitle1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      //padding: const EdgeInsets.only(left: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: (lecture.rating >= 4.0)
                            ? Theme.of(context).primaryColor.withOpacity(0.25)
                            : (lecture.rating >= 3.0)
                                ? Theme.of(context)
                                    .indicatorColor
                                    .withOpacity(0.25)
                                : (lecture.rating == 0.0)
                                    ? Theme.of(context).disabledColor
                                    : Theme.of(context)
                                        .errorColor
                                        .withOpacity(0.25),
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
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                size: 14.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: (lecture.rating == 0)
                                ? Text(
                                    '0,00',
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(
                                            color: Theme.of(context).hintColor),
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
                                                  ? Theme.of(context)
                                                      .indicatorColor
                                                  : Theme.of(context)
                                                      .errorColor,
                                        ),
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.record_voice_over,
                      color: Theme.of(context).primaryColor,
                      size: 24.0,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        lecture.lecturer,
                        style: Theme.of(context).textTheme.bodyText1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.school,
                      color: Theme.of(context).primaryColor,
                      size: 24.0,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        lecture.subject,
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: Theme.of(context).primaryColor,
                      size: 24.0,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        lecture.author,
                        style: Theme.of(context).textTheme.bodyText1,
                        overflow: TextOverflow.ellipsis,
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
          ),
        ),
      ),
    );
  }
}
