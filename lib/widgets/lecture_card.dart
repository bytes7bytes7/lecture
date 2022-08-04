import 'package:flutter/material.dart';
import 'package:rest_client/constants.dart' as const_api;
import 'package:rest_client/rest_client.dart';

import '../constants/measures.dart' as const_measures;
import '../constants/routes.dart' as const_routes;
import '../features/common/common.dart';
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
  });

  final Lecture lecture;

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
          onPressed: () {
            Navigator.of(context).pushNamed(
              const_routes.lecture,
              arguments: <String, Object?>{
                const_api.lecture: lecture,
              },
            );
          },
          child: Column(
            children: [
              Trio(
                null,
                lecture.topic,
                RatingBadge(
                  rating: lecture.getRating(),
                  amount: lecture.rating,
                ),
              ),
              Trio(
                Icons.record_voice_over,
                shortFIO(lecture.lecturer),
              ),
              Trio(
                Icons.school,
                lecture.subject,
              ),
              Trio(
                Icons.person,
                lecture.author.getFio(),
                Text(
                  lecture.date,
                  style: theme.textTheme.bodyText1?.copyWith(
                    color: theme.hintColor,
                  ),
                ),
              ),
            ].map((triple) {
              final first = triple.first;
              final third = triple.third;

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
                        '${triple.second}',
                        style: (first == null)
                            ? theme.textTheme.subtitle2
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
