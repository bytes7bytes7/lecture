import 'package:flutter/material.dart';

import '../constants/app.dart' as const_app;

class HighlightedTextSpan extends StatelessWidget {
  const HighlightedTextSpan({
    super.key,
    required this.src,
  });

  final String src;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final defaultStyle = theme.textTheme.bodyText1;
    final highlightStyle = theme.textTheme.subtitle2?.copyWith(
      color: theme.errorColor,
    );

    var splitIndex = src.indexOf(const_app.highlightPattern);
    var style = defaultStyle;

    final lst = <TextSpan>[];
    final buffer = StringBuffer();
    for (var i = 0; i < src.length; i++) {
      if (i == splitIndex) {
        lst.add(
          TextSpan(
            text: buffer.toString(),
            style: style,
          ),
        );
        buffer.clear();
        style = style == defaultStyle ? highlightStyle : defaultStyle;
        splitIndex = src.indexOf(const_app.highlightPattern, i + 1);
        i += const_app.highlightPattern.length - 1;
      } else {
        buffer.write(src[i]);
      }
    }

    if (buffer.isNotEmpty) {
      lst.add(
        TextSpan(
          text: buffer.toString(),
          style: style,
        ),
      );
    }

    return RichText(
      softWrap: true,
      textAlign: TextAlign.center,
      text: TextSpan(
        children: lst,
      ),
    );
  }
}
