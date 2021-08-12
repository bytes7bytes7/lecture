import 'package:flutter/material.dart';
import 'package:zefyrka/zefyrka.dart' hide ToggleStyleButton, LinkStyleButton;

import '../constants.dart';
import '../widgets/default_app_bar.dart';
import '../custom/zefyr_lite_toolbar/zefyr_lite_toolbar.dart';

class LectureEditorScreen extends StatelessWidget {
  const LectureEditorScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ZefyrController _controller = ZefyrController();
    final ValueNotifier<bool> editMode = ValueNotifier(true);
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: DefaultAppBar(
          prefix: Icons.arrow_back,
          prefixMessage: ConstantMessages.back,
          prefixOnPressed: () {
            Navigator.pop(context);
          },
          text: 'Новая лекция',
          suffix: Icons.more_vert,
          suffixMessage: ConstantMessages.additional,
          suffixOnPressed: () {},
        ),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  ZefyrLiteToolbar(
                    controller: _controller,
                    notifier: editMode,
                  ),
                  //ZefyrToolbar.basic(controller: _controller),
                  const SizedBox(height: 25.0),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    height: 40.0,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFF14A391)),
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
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xFF14A391)),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: ZefyrEditor(
                                  controller: _controller,
                                  autofocus: true,
                                  readOnly: !value,
                                  scrollPhysics: const BouncingScrollPhysics(),
                                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                  /// Add cursorColor property to editor.dart in zefyrka package this way:
                                  /// 1) Add into ZefyrEditor class: "final Color? cursorColor;"
                                  /// 2) Add into ZefyrEditor constructor: "this.cursorColor,"
                                  /// 3) Replace "cursorColor ??= selectionTheme.cursorColor ?? cupertinoTheme.primaryColor;" on "cursorColor = widget.cursorColor ?? selectionTheme.cursorColor ?? cupertinoTheme.primaryColor;"
                                  /// 4) Replace "cursorColor ??= selectionTheme.cursorColor ?? theme.colorScheme.primary;" on "cursorColor = widget.cursorColor ?? selectionTheme.cursorColor ?? theme.colorScheme.primary;"
                                  cursorColor: Theme.of(context).primaryColor,
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
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFEDEDED),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.https_outlined,
                                      color: Color(0xFF14A391),
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
