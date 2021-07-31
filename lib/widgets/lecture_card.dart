import 'package:flutter/material.dart';

import '../screens/lecture_screen.dart';
import '../models/lecture.dart';

class LectureCard extends StatelessWidget {
  const LectureCard({
    Key? key,
    required this.lecture,
  }) : super(key: key);

  final Lecture lecture;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(
          color: Theme.of(context).focusColor,
        ),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return LectureScreen(
                  lecture: lecture,
                );
              },
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Предмет: ',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      TextSpan(
                        text: lecture.subject,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(color: Theme.of(context).focusColor),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Лектор: ',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      TextSpan(
                        text: lecture.lecturer,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(color: Theme.of(context).focusColor),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Тема: ',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          TextSpan(
                            text: lecture.topic,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(color: Theme.of(context).focusColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    lecture.rating.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: Theme.of(context).focusColor),
                  ),
                  const Icon(
                    Icons.star_border_outlined,
                    size: 18,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
