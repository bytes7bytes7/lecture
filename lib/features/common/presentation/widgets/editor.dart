import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as fq;
import 'package:tuple/tuple.dart';

import '../../../../constants/measures.dart' as const_measures;
import '../../../../l10n/l10n.dart';
import '../list_bottom_overlay.dart';
import 'line_button.dart';

const _editorPadding = EdgeInsets.symmetric(
  horizontal: const_measures.smallPadding,
  vertical: const_measures.smallPadding,
);
const _verSpacing = Tuple2(3.0, 3.0);
const _lineSpacing = Tuple2(3.0, 3.0);

class Editor extends StatelessWidget {
  const Editor({
    super.key,
    required this.controller,
    required this.focus,
    required this.scroll,
    required this.readOnly,
  });

  final fq.QuillController controller;
  final FocusNode focus;
  final ScrollController scroll;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context);

    return fq.QuillEditor(
      controller: controller,
      focusNode: focus,
      scrollController: scroll,
      scrollable: false,
      padding: _editorPadding,
      autoFocus: false,
      readOnly: readOnly,
      showCursor: !readOnly,
      expands: true,
      locale: locale,
      scrollPhysics: const BouncingScrollPhysics(),
      placeholder: l10n.lectureText,
      linkActionPickerDelegate: _linkDelegate,
      customStyles: fq.DefaultStyles(
        placeHolder: fq.DefaultTextBlockStyle(
          _textStyle(theme.inputDecorationTheme.hintStyle),
          _verSpacing,
          _lineSpacing,
          null,
        ),
        paragraph: fq.DefaultTextBlockStyle(
          _textStyle(theme.textTheme.bodyText1),
          _verSpacing,
          _lineSpacing,
          null,
        ),
        h1: fq.DefaultTextBlockStyle(
          _textStyle(
            theme.textTheme.bodyText1?.copyWith(
              fontSize: 26,
            ),
          ),
          _verSpacing,
          _lineSpacing,
          null,
        ),
        h2: fq.DefaultTextBlockStyle(
          _textStyle(
            theme.textTheme.bodyText1?.copyWith(
              fontSize: 23,
            ),
          ),
          _verSpacing,
          _lineSpacing,
          null,
        ),
        h3: fq.DefaultTextBlockStyle(
          _textStyle(
            theme.textTheme.bodyText1?.copyWith(
              fontSize: 20,
            ),
          ),
          _verSpacing,
          _lineSpacing,
          null,
        ),
      ),
    );
  }

  TextStyle _textStyle(TextStyle? style) => style ?? const TextStyle();

  Future<fq.LinkMenuAction> _linkDelegate(
    BuildContext context,
    String link,
    node,
  ) async {
    final l10n = context.l10n;
    final result = await showListBottomOverlay<fq.LinkMenuAction>(
      context: context,
      actions: <Tuple3<String, IconData, VoidCallback>>[
        Tuple3(
          l10n.launchUrl,
          Icons.language,
          () => Navigator.of(context).pop(fq.LinkMenuAction.launch),
        ),
        Tuple3(
          l10n.copyUrl,
          Icons.copy,
          () => Navigator.of(context).pop(fq.LinkMenuAction.copy),
        ),
        Tuple3(
          l10n.removeUrl,
          Icons.delete_outline,
          () => Navigator.of(context).pop(fq.LinkMenuAction.remove),
        ),
      ].map<Widget>((e) {
        return LineButton(
          text: e.item1,
          icon: e.item2,
          onPressed: e.item3,
        );
      }).toList(),
    );

    return result ?? fq.LinkMenuAction.none;
  }
}
