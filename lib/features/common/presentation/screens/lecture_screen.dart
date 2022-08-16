import 'dart:convert';

import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as fq;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tuple/tuple.dart';

import '../../../../constants/measures.dart' as const_measures;
import '../../../../l10n/l10n.dart';
import '../../../../routes.dart';
import '../../../../scope/app_scope.dart';
import '../always_bouncing_scroll_physics.dart';
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
    required this.lectureId,
  });

  final int lectureId;

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

    // TODO: make request
    final lecture = Lecture.random();

    return Scaffold(
      appBar: DefaultAppBar(
        prefixConfig: AppBarButtonConfig(
          icon: Icons.arrow_back,
          tooltip: l10n.tooltipBack,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: l10n.lecture,
        canCopyTitle: true,
        suffix: PopupMenuButton<_PopupCallback>(
          onSelected: (value) => _onPopupSelected(lecture, value),
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
            mainAxisSize: MainAxisSize.min,
            children: [
              LectureHeader(lecture: lecture),
              Divider(
                height: _dividerHeight,
                thickness: _dividerThickness,
                color: theme.hintColor,
              ),
              FutureBuilder<Content?>(
                future: _loadContent(),
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

                  final content = snapshot.data;
                  if (content == null) {
                    return const LoadingCircle();
                  }

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: _topicPadding,
                        child: Text(
                          lecture.topic,
                          style: theme.textTheme.headline6,
                        ),
                      ),
                      IntrinsicHeight(
                        child: _ContentBody(
                          content: content,
                        ),
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

  Future<Content> _loadContent() {
    // TODO: Use request
    return Future.delayed(const Duration(seconds: 1), Content.random);
  }

  void _onPopupSelected(Lecture lecture, _PopupCallback value) {
    switch (value) {
      case _PopupCallback.addBookmark:
        ref.read(AppScope.get().loggerManager).log('add bookmark');
        break;
      case _PopupCallback.goToAuthor:
        ref.read(AppScope.get().loggerManager).log('go to the author');

        AuthorRoute(aid: lecture.author.id).push(context);
        break;
    }
  }
}

class _ContentBody extends StatefulWidget {
  const _ContentBody({
    // ignore: unused_element
    super.key,
    required this.content,
  });

  final Content content;

  @override
  State<_ContentBody> createState() => _ContentBodyState();
}

class _ContentBodyState extends State<_ContentBody> {
  late final fq.QuillController _contentController;
  late final FocusNode _focus;
  late final ScrollController _scroll;

  @override
  void initState() {
    super.initState();

    // TODO: load and pass json
    _contentController = fq.QuillController(
      document: fq.Document.fromJson(jsonDecode(widget.content.text)),
      selection: const TextSelection.collapsed(offset: 0),
    );
    _focus = FocusNode();
    _scroll = ScrollController();
  }

  @override
  void dispose() {
    _contentController.dispose();
    _focus.dispose();
    _scroll.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Editor(
      controller: _contentController,
      focus: _focus,
      scroll: _scroll,
      readOnly: true,
    );
  }
}
