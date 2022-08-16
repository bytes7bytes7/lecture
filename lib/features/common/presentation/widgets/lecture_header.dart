import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

import '../../../../l10n/l10n.dart';
import 'rating_badge.dart';
import 'status_badge.dart';

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
      children: <Tuple3<String, String, Widget?>>[
        Tuple3(
          l10n.lecturer,
          shortFIO(lecture.lecturer),
          lecture.status == Status.notPublished
              ? null
              : lecture.status == Status.published
                  ? RatingBadge(
                      rating: lecture.getRating(),
                      amount: lecture.rating,
                    )
                  : StatusBadge(
                      status: lecture.status,
                    ),
        ),
        Tuple3(
          l10n.subject,
          lecture.subject,
          null,
        ),
        Tuple3(
          l10n.institution,
          lecture.institution,
          null,
        ),
        Tuple3(
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
        final third = e.item3;

        return Padding(
          padding: _labelPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                e.item1,
                style: theme.textTheme.bodyText2?.copyWith(
                  color: theme.primaryColor,
                ),
              ),
              _labelAndValueSeparator,
              Expanded(
                child: Text(
                  e.item2,
                  style: theme.textTheme.bodyText1,
                ),
              ),
              if (third != null) third,
            ],
          ),
        );
      }).toList(),
    );
  }
}
