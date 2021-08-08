import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:zefyrka/zefyrka.dart';

import 'zefyr_lite_toolbar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final ZefyrController _controller = ZefyrController();
  final ValueNotifier<String> data = ValueNotifier('');
  final ValueNotifier<bool> editMode = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Test'),
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                ZefyrLiteToolbar(
                  controller: _controller,
                  notifier: editMode,
                ),
                const SizedBox(
                  height: 40.0,
                  child: TextField(
                    autofocus: true,
                  ),
                ),
                Expanded(
                  child: ValueListenableBuilder(
                    valueListenable: editMode,
                    builder: (context, bool value, __) {
                      return Stack(
                        children: [
                          ZefyrEditor(
                            readOnly: !value,
                            autofocus: true,
                            controller: _controller,
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
                                    shape:  BoxShape.circle,
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
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              child: const Icon(Icons.copy),
              onPressed: () {
                data.value = jsonEncode(_controller.document);
                debugPrint(data.value);
              },
            ),
            const SizedBox(width: 10),
            FloatingActionButton(
              child: const Icon(Icons.paste),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
