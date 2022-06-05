import 'package:flutter/material.dart';
import 'package:zefyrka/zefyrka.dart' hide ToggleStyleButton, LinkStyleButton;

import '../constants/tooltips.dart' as const_tooltips;
import '../custom/zefyr_lite_toolbar/zefyr_lite_toolbar.dart';
import '../widgets/default_app_bar.dart';

class LectureEditorScreen extends StatelessWidget {
  const LectureEditorScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          prefixMessage: const_tooltips.back,
          prefixOnPressed: () {
            Navigator.pop(context);
          },
          text: 'Новая лекция',
          suffix: Icons.more_vert,
          suffixMessage: const_tooltips.additional,
          suffixOnPressed: () {},
        ),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
              child: Column(
                children: [
                  ZefyrLiteToolbar(
                    controller: controller,
                    notifier: editMode,
                    dividerColor: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  //ZefyrToolbar.basic(controller: _controller),
                  const SizedBox(height: 25.0),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    height: 40.0,
                    decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).primaryColor),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: TextField(
                        autofocus: true,
                        scrollPhysics: const BouncingScrollPhysics(),
                        style: Theme.of(context).textTheme.bodyText1,
                        cursorColor: Theme.of(context).primaryColor,
                        decoration: InputDecoration(
                          hintText: 'Тема',
                          hintStyle: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: Theme.of(context).hintColor),
                          isCollapsed: true,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25.0),
                  Expanded(
                    child: ValueListenableBuilder(
                      valueListenable: editMode,
                      builder: (context, bool value, __) {
                        return Stack(
                          children: [
                            Positioned.fill(
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: ZefyrEditor(
                                  // TODO: add textStyle
                                  controller: controller,
                                  autofocus: true,
                                  readOnly: !value,
                                  scrollPhysics: const BouncingScrollPhysics(),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0,
                                  ),

                                  /// Add cursorColor property to editor.dart in zefyrka package this way:
                                  /// 1) Add into ZefyrEditor class: "final Color? cursorColor;"
                                  /// 2) Add into ZefyrEditor constructor: "this.cursorColor,"
                                  /// 3) Replace "cursorColor ??= selectionTheme.cursorColor ?? cupertinoTheme.primaryColor;" on "cursorColor = widget.cursorColor ?? selectionTheme.cursorColor ?? cupertinoTheme.primaryColor;"
                                  /// 4) Replace "cursorColor ??= selectionTheme.cursorColor ?? theme.colorScheme.primary;" on "cursorColor = widget.cursorColor ?? selectionTheme.cursorColor ?? theme.colorScheme.primary;"
                                ),
                              ),
                            ),
                            if (!value)
                              Positioned(
                                right: 100.0,
                                left: 100.0,
                                bottom: 50.0,
                                child: Tooltip(
                                  message: 'Editing blocked',
                                  child: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).disabledColor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.https_outlined,
                                      color: Theme.of(context).primaryColor,
                                      size: 24.0,
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
