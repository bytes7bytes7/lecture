import 'package:flutter/material.dart';
import 'package:zefyrka/zefyrka.dart' hide ToggleStyleButton, LinkStyleButton;

import '../../../../constants/measures.dart' as const_measures;
import '../../../../custom/zefyr_lite_toolbar/zefyr_lite_toolbar.dart';
import '../../../../l10n/l10n.dart';
import '../../../common/common.dart';

const _padding = EdgeInsets.symmetric(
  horizontal: const_measures.mainHorMargin,
  vertical: const_measures.mainVerMargin,
);
const _separator = SizedBox(height: 25);
const _topicContentPadding = EdgeInsets.all(10);
const _zefyrPadding = EdgeInsets.symmetric(
  horizontal: 10.0,
);
const _blockPadding = EdgeInsets.all(8.0);
const _blockBottomOffset = 50.0;

class LectureEditorScreen extends StatefulWidget {
  const LectureEditorScreen({
    super.key,
  });

  @override
  State<LectureEditorScreen> createState() => _LectureEditorScreenState();
}

class _LectureEditorScreenState extends State<LectureEditorScreen> {
  late final ZefyrController _controller;
  late final ValueNotifier<bool> _editMode;

  @override
  void initState() {
    super.initState();

    _controller = ZefyrController();
    _editMode = ValueNotifier<bool>(true);
  }

  @override
  void dispose() {
    _controller.dispose();
    _editMode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: DefaultAppBar(
          prefix: Icons.arrow_back,
          prefixTooltip: l10n.tooltipBack,
          prefixOnPressed: () {
            Navigator.pop(context);
          },
          title: l10n.editor,
          suffix: Icons.more_vert,
          suffixTooltip: l10n.tooltipAdditional,
          suffixOnPressed: () {},
        ),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: _padding,
              child: Column(
                children: [
                  ZefyrLiteToolbar(
                    controller: _controller,
                    notifier: _editMode,
                    dividerColor: theme.scaffoldBackgroundColor,
                  ),
                  _separator,
                  TextField(
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
                      builder: (context, bool value, child) {
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
                                child: ZefyrEditor(
                                  controller: _controller,
                                  autofocus: true,
                                  readOnly: !value,
                                  scrollPhysics: const BouncingScrollPhysics(),
                                  padding: _zefyrPadding,
                                  expands: true,
                                ),
                              ),
                            ),
                            if (!value)
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
}
