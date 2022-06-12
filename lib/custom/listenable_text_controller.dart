import 'dart:async';

import 'package:flutter/cupertino.dart';

class ListenableTextController extends TextEditingController {
  final _controller = StreamController<String>();
  bool _isListening = false;

  Stream<String> get stream {
    if (!_isListening) {
      addListener(() {
        _controller.add(text);
      });
      _isListening = true;
    }
    return _controller.stream;
  }
}
