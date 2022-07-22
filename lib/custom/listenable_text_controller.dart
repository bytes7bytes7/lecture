import 'dart:async';

import 'package:flutter/material.dart';

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

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}
