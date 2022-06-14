import 'package:flutter/material.dart';
import 'package:rest_client/rest_client.dart';

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
            second: shortFIO(lecture.lecturer),
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
            first: 'Учреждение:',
            second: lecture.institution,
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
