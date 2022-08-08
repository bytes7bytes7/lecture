import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../../common.dart';

const _requestDelay = Duration(seconds: 2);

class SearchBar extends StatefulWidget {
  const SearchBar({
    super.key,
    required this.hint,
    required this.onSubmitted,
  });

  final String hint;
  final void Function(String) onSubmitted;

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late final ListenableTextController _controller;
  late final StreamSubscription _sub;

  @override
  void initState() {
    super.initState();

    _controller = ListenableTextController();
    _sub = _controller.stream
        .debounceTime(_requestDelay)
        .listen(widget.onSubmitted);
  }

  @override
  void dispose() {
    _controller.dispose();
    _sub.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModTextField(
      controller: _controller,
      icon: Icons.search,
      hint: widget.hint,
    );
  }
}
