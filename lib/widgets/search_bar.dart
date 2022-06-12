import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../constants/measures.dart' as const_measures;
import '../custom/listenable_text_controller.dart';

const _margin = EdgeInsets.fromLTRB(
  const_measures.mainHorMargin,
  12.0,
  const_measures.mainHorMargin,
  0.0,
);
const _padding = EdgeInsets.symmetric(
  horizontal: 20.0,
  vertical: 10.0,
);
const _requestDelay = Duration(seconds: 2);

class SearchBar extends StatefulWidget {
  const SearchBar({
    Key? key,
    required this.hint,
    required this.onSubmitted,
  }) : super(key: key);

  final String hint;
  final void Function(String) onSubmitted;

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late final ListenableTextController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ListenableTextController()
      ..stream.debounceTime(_requestDelay).listen(widget.onSubmitted);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: _margin,
      padding: _padding,
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(
          const_measures.mainBorderRadius,
        ),
        border: Border.all(
          color: theme.primaryColor,
        ),
      ),
      child: TextField(
        controller: _controller,
        scrollPhysics: const BouncingScrollPhysics(),
        textAlignVertical: TextAlignVertical.center,
        style: theme.textTheme.bodyText1,
        cursorColor: theme.primaryColor,
        decoration: InputDecoration(
          isCollapsed: true,
          border: InputBorder.none,
          suffixIcon: SizedBox(
            child: Icon(
              Icons.search,
              color: theme.primaryColor,
            ),
          ),
          suffixIconConstraints: const BoxConstraints(
            maxHeight: const_measures.smallIconSize,
            maxWidth: const_measures.smallIconSize,
          ),
          hintText: widget.hint,
          hintStyle: theme.textTheme.bodyText1?.copyWith(
            color: theme.hintColor,
          ),
        ),
      ),
    );
  }
}
