import 'package:flutter/material.dart';

import '../../../../constants/app.dart' as const_app;

class HighlightedTextSpan extends StatelessWidget {
  const HighlightedTextSpan({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final defaultStyle = theme.textTheme.bodyText1;
    final highlightStyle = theme.textTheme.bodyText2?.copyWith(
      color: theme.errorColor,
    );

    var splitIndex = text.indexOf(const_app.highlightPattern);
    var style = defaultStyle;

    final lst = <TextSpan>[];
    final buffer = StringBuffer();
    for (var i = 0; i < text.length; i++) {
      if (i == splitIndex) {
        lst.add(
          TextSpan(
            text: buffer.toString(),
            style: style,
          ),
        );
        buffer.clear();
        style = style == defaultStyle ? highlightStyle : defaultStyle;
        splitIndex = text.indexOf(const_app.highlightPattern, i + 1);
        i += const_app.highlightPattern.length - 1;
      } else {
        buffer.write(text[i]);
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
