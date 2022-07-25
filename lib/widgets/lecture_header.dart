import 'package:flutter/material.dart';
import 'package:rest_client/rest_client.dart';

import '../l10n/l10n.dart';
import '../utils/triple.dart';
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
          Triple(
            first: l10n.lecturer,
            second: shortFIO(lecture.lecturer),
            third: RatingBadge(
              rating: lecture.getRating(),
              amount: lecture.rating,
            ),
          ),
          Triple(
            first: l10n.subject,
            second: lecture.subject,
          ),
          Triple(
            first: l10n.institution,
            second: lecture.institution,
          ),
          Triple(
            first: l10n.author,
            second: lecture.author.getFio(),
            third: Text(
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
