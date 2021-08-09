import 'package:flutter/material.dart';
import 'package:zefyrka/zefyrka.dart'  hide ToggleStyleButton, LinkStyleButton;
import '../widgets/zefyr_lite_toolbar/zefyr_lite_toolbar.dart';

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
                    height: 40.0,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFF14A391)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Center(
                      child: TextField(
                        autofocus: true,
                        scrollPhysics: BouncingScrollPhysics(),
                        decoration: InputDecoration(
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
                                  scrollPhysics:
                                  const BouncingScrollPhysics(),
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