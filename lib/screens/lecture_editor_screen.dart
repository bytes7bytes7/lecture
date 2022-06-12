import 'package:flutter/material.dart';
import 'package:zefyrka/zefyrka.dart' hide ToggleStyleButton, LinkStyleButton;

import '../constants/measures.dart' as const_measures;
import '../constants/tooltips.dart' as const_tooltips;
import '../custom/zefyr_lite_toolbar/zefyr_lite_toolbar.dart';
import '../widgets/default_app_bar.dart';

const _padding = EdgeInsets.symmetric(
  horizontal: const_measures.mainHorMargin,
  vertical: 15.0,
);
const _separator = SizedBox(height: 25);
const _topicContentPadding = EdgeInsets.all(10);
const _zefyrPadding = EdgeInsets.symmetric(
  horizontal: 10.0,
);
const _blockPadding = EdgeInsets.all(8.0);
const _blockBottomOffset = 50.0;

class LectureEditorScreen extends StatelessWidget {
  const LectureEditorScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final controller = ZefyrController();
    final editMode = ValueNotifier<bool>(true);

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: DefaultAppBar(
          prefix: Icons.arrow_back,
          prefixTooltip: const_tooltips.back,
          prefixOnPressed: () {
            Navigator.pop(context);
          },
          title: 'Новая лекция',
          suffix: Icons.more_vert,
          suffixTooltip: const_tooltips.additional,
          suffixOnPressed: () {},
        ),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: _padding,
              child: Column(
                children: [
                  ZefyrLiteToolbar(
                    controller: controller,
                    notifier: editMode,
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
                      hintText: 'Тема',
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
                      valueListenable: editMode,
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
                                  controller: controller,
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
                                  message: 'Режим просмотра',
                                  child: Container(
                                    padding: _blockPadding,
                                    decoration: BoxDecoration(
                                      color: theme.disabledColor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.https_outlined,
                                      color: theme.primaryColor,
                                      size: const_measures.smallIconSize,
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
