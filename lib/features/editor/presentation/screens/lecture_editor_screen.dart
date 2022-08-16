import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as fq;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tuple/tuple.dart';

import '../../../../constants/measures.dart' as const_measures;
import '../../../../l10n/l10n.dart';
import '../../../../scope/app_scope.dart';
import '../../../common/common.dart';
import '../widgets/widgets.dart';

const _padding = EdgeInsets.symmetric(
  horizontal: const_measures.mainHorMargin,
  vertical: const_measures.mainVerMargin,
);
const _separator = SizedBox(height: 25);
const _topicContentPadding = EdgeInsets.all(10);
const _blockPadding = EdgeInsets.all(8.0);
const _blockBottomOffset = 50.0;

enum _PopupCallback {
  publish,
  saveDraft,
}

class LectureEditorScreen extends ConsumerStatefulWidget {
  const LectureEditorScreen({
    super.key,
  });

  @override
  ConsumerState<LectureEditorScreen> createState() =>
      _LectureEditorScreenState();
}

class _LectureEditorScreenState extends ConsumerState<LectureEditorScreen> {
  late final TextEditingController _topicController;
  late final fq.QuillController _draftController;
  late final FocusNode _editorFocus;
  late final ScrollController _editorScroll;
  late final ValueNotifier<bool> _editMode;

  @override
  void initState() {
    super.initState();

    _topicController = TextEditingController();
    _draftController = fq.QuillController.basic();
    _editorFocus = FocusNode();
    _editorScroll = ScrollController();
    _editMode = ValueNotifier(true);
  }

  @override
  void dispose() {
    _topicController.dispose();
    _draftController.dispose();
    _editorFocus.dispose();
    _editorScroll.dispose();
    _editMode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context);

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: DefaultAppBar(
          prefixConfig: AppBarButtonConfig(
            icon: Icons.arrow_back,
            tooltip: l10n.tooltipBack,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: l10n.editor,
          suffix: PopupMenuButton<_PopupCallback>(
            onSelected: _onPopupSelected,
            iconSize: const_measures.bigIconSize,
            position: PopupMenuPosition.under,
            tooltip: l10n.tooltipAdditional,
            itemBuilder: (context) {
              return <Tuple3<_PopupCallback, IconData, String>>[
                Tuple3(
                  _PopupCallback.publish,
                  Icons.cloud_upload,
                  l10n.publish,
                ),
                Tuple3(
                  _PopupCallback.saveDraft,
                  Icons.save_alt,
                  l10n.addToDrafts,
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
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: _padding,
              child: Column(
                children: [
                  fq.QuillToolbar.basic(
                    controller: _draftController,
                    locale: locale,
                    iconTheme: fq.QuillIconTheme(
                      iconUnselectedColor: theme.primaryColor,
                      iconUnselectedFillColor: theme.disabledColor,
                      iconSelectedColor: theme.scaffoldBackgroundColor,
                      iconSelectedFillColor: theme.primaryColor,
                      disabledIconColor: theme.hintColor,
                      disabledIconFillColor: Colors.transparent,
                    ),
                    dialogTheme: fq.QuillDialogTheme(
                      dialogBackgroundColor: theme.scaffoldBackgroundColor,
                      inputTextStyle: theme.textTheme.bodyText1,
                    ),
                  ),
                  _separator,
                  TextField(
                    controller: _topicController,
                    autofocus: true,
                    scrollPhysics: const BouncingScrollPhysics(),
                    style: theme.textTheme.bodyText1,
                    cursorColor: theme.primaryColor,
                    decoration: InputDecoration(
                      isCollapsed: true,
                      contentPadding: _topicContentPadding,
                      hintText: l10n.topic,
                      hintStyle: theme.textTheme.bodyText1
                          ?.copyWith(color: theme.hintColor),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          const_measures.mainBorderRadius,
                        ),
                        borderSide: BorderSide(
                          color: theme.hintColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          const_measures.mainBorderRadius,
                        ),
                        borderSide: BorderSide(
                          color: theme.primaryColor,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          const_measures.mainBorderRadius,
                        ),
                        borderSide: BorderSide(
                          color: theme.errorColor,
                        ),
                      ),
                    ),
                  ),
                  _separator,
                  Expanded(
                    child: ValueListenableBuilder(
                      valueListenable: _editMode,
                      builder: (context, bool isLocked, child) {
                        return Stack(
                          children: [
                            Positioned.fill(
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: theme.primaryColor,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    const_measures.mainBorderRadius,
                                  ),
                                ),
                                child: Editor(
                                  controller: _draftController,
                                  focus: _editorFocus,
                                  scroll: _editorScroll,
                                  isLocked: isLocked,
                                ),
                              ),
                            ),
                            if (!isLocked)
                              Positioned(
                                right: 0,
                                left: 0,
                                bottom: _blockBottomOffset,
                                child: Tooltip(
                                  message: l10n.viewMode,
                                  child: Container(
                                    padding: _blockPadding,
                                    decoration: BoxDecoration(
                                      color: theme.disabledColor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.https_outlined,
                                      color: theme.primaryColor,
                                      size: const_measures.midIconSize,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onPopupSelected(_PopupCallback value) {
    switch (value) {
      case _PopupCallback.publish:
        ref.read(AppScope.get().loggerManager).log('publish');

        final editorRepo = ref.read(AppScope.get().editorRepo);

        final lecture = editorRepo.lecture.value.copyWith(
          topic: _topicController.text,
        );
        final content = editorRepo.content.value.copyWith(
          text: jsonEncode(_draftController.document.toDelta().toJson()),
        );

        ref
            .read(AppScope.get().editorController.notifier)
            .publish(lecture, content);
        break;
      case _PopupCallback.saveDraft:
        ref.read(AppScope.get().loggerManager).log('save draft');
        final editorRepo = ref.read(AppScope.get().editorRepo);

        final lecture = editorRepo.lecture.value.copyWith(
          topic: _topicController.text,
        );

        final content = editorRepo.content.value.copyWith(
          text: jsonEncode(_draftController.document.toDelta().toJson()),
        );

        ref
            .read(AppScope.get().editorController.notifier)
            .saveDraft(lecture, content);
        break;
    }
  }
}
