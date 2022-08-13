import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tuple/tuple.dart';

import '../constants/measures.dart' as const_measures;

import '../features/common/common.dart';
import '../l10n/l10n.dart';
import '../scope/app_scope.dart';
import '../widgets/widgets.dart';

const _ratingInitValue = 0;
const _dividerHeight = 20.0;
const _dividerThickness = 1.0;
const _dividerIndent = 15.0;

const _contentPadding = EdgeInsets.symmetric(
  horizontal: const_measures.mainHorMargin,
  vertical: const_measures.mainVerMargin,
);
const _topicPadding = EdgeInsets.symmetric(vertical: 15.0);
const _conclusionPadding = EdgeInsets.symmetric(vertical: 20.0);

enum _PopupCallback {
  addBookmark,
  goToAuthor,
}

class LectureScreen extends ConsumerStatefulWidget {
  const LectureScreen({
    super.key,
    required this.lecture,
  });

  final Lecture lecture;

  @override
  ConsumerState<LectureScreen> createState() => _LectureScreenState();
}

class _LectureScreenState extends ConsumerState<LectureScreen> {
  late final ValueNotifier<int> _ratingNotifier;

  @override
  void initState() {
    super.initState();

    _ratingNotifier = ValueNotifier<int>(_ratingInitValue);
  }

  @override
  void dispose() {
    _ratingNotifier.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return Scaffold(
      appBar: DefaultAppBar(
        prefixConfig: AppBarButtonConfig(
          icon: Icons.arrow_back,
          tooltip: l10n.tooltipBack,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: l10n.lecture,
        canCopyTitle: true,
        suffix: PopupMenuButton<_PopupCallback>(
          onSelected: _onPopupSelected,
          iconSize: const_measures.bigIconSize,
          position: PopupMenuPosition.under,
          tooltip: l10n.tooltipAdditional,
          itemBuilder: (context) {
            return <Tuple3<_PopupCallback, IconData, String>>[
              Tuple3(
                _PopupCallback.addBookmark,
                Icons.bookmark_border,
                l10n.addBookmark,
              ),
              Tuple3(
                _PopupCallback.goToAuthor,
                Icons.person_outline,
                l10n.goToAuthor,
              ),
            ].map<PopupMenuItem<_PopupCallback>>((e) {
              // do NOT add navigation to onTap,
              // because it does NOT work until this menu closes
              return PopupMenuItem(
                value: e.item1,
                child: Row(
                  children: [
                    Icon(
                      e.item2,
                      color: theme.primaryColor,
                      size: const_measures.midIconSize,
                    ),
                    const SizedBox(
                      width: const_measures.smallPadding,
                    ),
                    Text(
                      e.item3,
                      style: theme.textTheme.bodyText1,
                    ),
                  ],
                ),
              );
            }).toList();
          },
        ),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysBouncingScrollPhysics(),
        child: Padding(
          padding: _contentPadding,
          child: Column(
            children: [
              LectureHeader(lecture: widget.lecture),
              Divider(
                height: _dividerHeight,
                thickness: _dividerThickness,
                color: theme.hintColor,
              ),
              Padding(
                padding: _topicPadding,
                child: Text(
                  widget.lecture.topic,
                  style: theme.textTheme.headline6,
                ),
              ),
              FutureBuilder<Content?>(
                future: Future.value(Content.random()),
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
                              l10n.ratingTitle,
                              style: theme.textTheme.bodyText2?.copyWith(
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
                        ratingNotifier: _ratingNotifier,
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

  void _onPopupSelected(_PopupCallback value) {
    switch (value) {
      case _PopupCallback.addBookmark:
        ref.read(AppScope.get().loggerManager).log('add bookmark');
        break;
      case _PopupCallback.goToAuthor:
        ref.read(AppScope.get().loggerManager).log('go to the author');
        break;
    }
  }
}
