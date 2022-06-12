import 'package:flutter/material.dart';

import '../models/lecture.dart';
import '../models/user.dart';
import '../utils/triple.dart';
import 'rating_badge.dart';

const _labelPadding = EdgeInsets.symmetric(vertical: 3);
const _labelAndValueSeparator = SizedBox(width: 6);

class LectureHeader extends StatelessWidget {
  const LectureHeader({
    Key? key,
    required this.lecture,
  }) : super(key: key);

  final Lecture lecture;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        ...[
          Triple(
            first: 'Лектор:',
            second: lecture.lecturer.getFio(),
            third: RatingBadge(
              rating: lecture.getRating(),
              amount: lecture.rating,
            ),
          ),
          Triple(
            first: 'Предмет:',
            second: lecture.subject,
          ),
          Triple(
            first: 'Факультет:',
            second: lecture.faculty,
          ),
          Triple(
            first: 'Уровень:',
            second: lecture.level,
          ),
          Triple(
            first: 'Семестр:',
            second: lecture.semester,
          ),
          Triple(
            first: 'Автор:',
            second: lecture.author.getFio(),
            third: Text(
              lecture.date,
              style: theme.textTheme.bodyText1?.copyWith(
                color: theme.hintColor,
              ),
            ),
          ),
        ].map((triple) {
          final third = triple.third;

          return Padding(
            padding: _labelPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${triple.first}',
                  style: theme.textTheme.subtitle1?.copyWith(
                    color: theme.primaryColor,
                  ),
                ),
                _labelAndValueSeparator,
                Expanded(
                  child: Text(
                    '${triple.second}',
                    style: theme.textTheme.bodyText1,
                  ),
                ),
                if (third is Widget) third,
              ],
            ),
          );
        }),
      ],
    );
  }
}
