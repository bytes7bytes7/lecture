import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rest_client/constants.dart' as const_api;
import 'package:rest_client/rest_client.dart';

import '../constants/measures.dart' as const_measures;
import '../constants/routes.dart' as const_routes;
import '../constants/tooltips.dart' as const_tooltips;
import '../custom/always_bouncing_scroll_physics.dart';
import '../scope/app_scope.dart';
import '../utils/triple.dart';
import '../widgets/widgets.dart';

const _ratingInitValue = 0;
const _dividerHeight = 20.0;
const _dividerThickness = 1.0;
const _dividerIndent = 15.0;
const _menuTopOffset = 100.0;
const _menuBottomOffset = 0.0;
const _menuBorderRadius = 20.0;
const _contentPadding = EdgeInsets.symmetric(
  horizontal: const_measures.mainHorMargin,
  vertical: 15.0,
);
const _topicPadding = EdgeInsets.symmetric(vertical: 15.0);
const _conclusionPadding = EdgeInsets.symmetric(vertical: 20.0);
const _menuItemSeparator = SizedBox(width: 10);

class LectureScreen extends ConsumerWidget {
  const LectureScreen({
    super.key,
    required this.lecture,
  });

  final Lecture lecture;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final ratingNotifier = ValueNotifier<int>(_ratingInitValue);

    return Scaffold(
      appBar: DefaultAppBar(
        prefix: Icons.arrow_back,
        prefixTooltip: const_tooltips.back,
        prefixOnPressed: () {
          Navigator.pop(context);
        },
        title: 'Лекция',
        suffix: Icons.more_vert,
        suffixTooltip: const_tooltips.additional,
        suffixOnPressed: () => _showMenu(context, ref),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysBouncingScrollPhysics(),
        child: Padding(
          padding: _contentPadding,
          child: Column(
            children: [
              LectureHeader(lecture: lecture),
              Divider(
                height: _dividerHeight,
                thickness: _dividerThickness,
                color: theme.hintColor,
              ),
              Padding(
                padding: _topicPadding,
                child: Text(
                  lecture.topic,
                  style: theme.textTheme.headline3,
                ),
              ),
              FutureBuilder<Content?>(
                future:
                    ref.read(AppScope.get().lectureRepo).getContent(lecture.id),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return ErrorLabel(
                      tryAgain: () {
                        ref
                            .read(AppScope.get().loggerManager)
                            .log("Load lecture's content again");
                      },
                    );
                  }

                  final data = snapshot.data;
                  if (data == null) {
                    return const LoadingCircle();
                  }

                  return Column(
                    children: [
                      Text(
                        data.text,
                        style: theme.textTheme.bodyText1,
                      ),
                      Padding(
                        padding: _conclusionPadding,
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                endIndent: _dividerIndent,
                                thickness: _dividerThickness,
                                color: theme.hintColor,
                              ),
                            ),
                            Text(
                              'Было полезно?',
                              style: theme.textTheme.subtitle1?.copyWith(
                                color: theme.primaryColor,
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                indent: _dividerIndent,
                                thickness: _dividerThickness,
                                color: theme.hintColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      RatingStars(
                        ratingNotifier: ratingNotifier,
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showMenu(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    showMenu(
      context: context,
      // add 1 to left component to move menu to the right
      position: const RelativeRect.fromLTRB(
        const_measures.mainHorMargin + 1,
        _menuTopOffset,
        const_measures.mainHorMargin,
        _menuBottomOffset,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_menuBorderRadius),
      ),
      items: const <Triple<int, IconData, String>>[
        Triple(
          first: 0,
          second: Icons.bookmark_border,
          third: 'В закладки',
        ),
        Triple(
          first: 1,
          second: Icons.person_outline,
          third: 'К автору',
        ),
      ].map<PopupMenuItem>((quad) {
        // do NOT add navigation to onTap,
        // because it does NOT work until this menu closes
        return PopupMenuItem(
          value: quad.first,
          child: Row(
            children: [
              Icon(
                quad.second,
                color: theme.primaryColor,
                size: const_measures.smallIconSize,
              ),
              _menuItemSeparator,
              Text(
                '${quad.third}',
                style: theme.textTheme.bodyText1,
              ),
            ],
          ),
        );
      }).toList(),
    ).then((value) {
      switch (value) {
        case 0:
          // TODO: add action "add a bookmark"
          ref.read(AppScope.get().loggerManager).info('Добавить в закладки');
          break;
        case 1:
          ref.read(AppScope.get().loggerManager).info('К автору');
          Navigator.of(context).pushNamed(
            const_routes.author,
            arguments: <String, Object?>{
              const_api.author: lecture.author,
            },
          );
          break;
      }
    });
  }
}
