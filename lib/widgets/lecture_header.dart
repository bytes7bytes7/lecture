import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '../features/common/common.dart';
import '../l10n/l10n.dart';
import 'rating_badge.dart';

const _labelPadding = EdgeInsets.symmetric(vertical: 3);
const _labelAndValueSeparator = SizedBox(width: 6);

class LectureHeader extends StatelessWidget {
  const LectureHeader({
    super.key,
    required this.lecture,
  });

  final Lecture lecture;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return Column(
      children: [
        ...[
          Trio(
            l10n.lecturer,
            shortFIO(lecture.lecturer),
            RatingBadge(
              rating: lecture.getRating(),
              amount: lecture.rating,
            ),
          ),
          Trio(
            l10n.subject,
            lecture.subject,
          ),
          Trio(
            l10n.institution,
            lecture.institution,
          ),
          Trio(
            l10n.author,
            lecture.author.getFio(),
            Text(
              lecture.date,
              style: theme.textTheme.bodyText1?.copyWith(
                color: theme.hintColor,
              ),
            ),
          ),
        ].map((e) {
          final third = e.third;

          return Padding(
            padding: _labelPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${e.first}',
                  style: theme.textTheme.subtitle2?.copyWith(
                    color: theme.primaryColor,
                  ),
                ),
                _labelAndValueSeparator,
                Expanded(
                  child: Text(
                    '${e.second}',
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
