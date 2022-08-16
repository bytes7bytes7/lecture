import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

import '../../../../constants/measures.dart' as const_measures;
import 'rating_badge.dart';

const _margin = EdgeInsets.symmetric(
  horizontal: const_measures.mainHorMargin,
  vertical: const_measures.mainVerMargin,
);
const _padding = EdgeInsets.all(12);
const _titlePadding = EdgeInsets.only(bottom: 10);
const _subtitlePadding = EdgeInsets.symmetric(vertical: 5);
const _blurRadius = 10.0;
const _verSizedBox = SizedBox(width: 10);

class LectureCard extends StatelessWidget {
  const LectureCard({
    super.key,
    required this.lecture,
    required this.onPressed,
  });

  final Lecture lecture;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      // need to specify height for ListView.itemExtent
      height: const_measures.cardHeight,
      margin: _margin,
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(
          const_measures.mainBorderRadius,
        ),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withOpacity(const_measures.smallOpacity),
            offset: const_measures.shadowOffset,
            blurRadius: _blurRadius,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          const_measures.mainBorderRadius,
        ),
        child: MaterialButton(
          padding: _padding,
          onPressed: onPressed,
          child: Column(
            children: <Tuple3<IconData?, String, Widget?>>[
              Tuple3(
                null,
                lecture.topic,
                RatingBadge(
                  rating: lecture.getRating(),
                  amount: lecture.rating,
                ),
              ),
              Tuple3(
                Icons.record_voice_over,
                shortFIO(lecture.lecturer),
                null,
              ),
              Tuple3(
                Icons.school,
                lecture.subject,
                null,
              ),
              Tuple3(
                Icons.person,
                lecture.author.getFio(),
                Text(
                  lecture.date,
                  style: theme.textTheme.bodyText1?.copyWith(
                    color: theme.hintColor,
                  ),
                ),
              ),
            ].map((e) {
              final first = e.item1;
              final third = e.item3;

              return Padding(
                padding: (first == null) ? _titlePadding : _subtitlePadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (first != null) ...[
                      Icon(
                        first,
                        color: theme.primaryColor,
                        size: const_measures.midIconSize,
                      ),
                      _verSizedBox,
                    ],
                    Expanded(
                      child: Text(
                        e.item2,
                        style: (first == null)
                            ? theme.textTheme.bodyText2
                            : theme.textTheme.bodyText1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (third != null) third,
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
