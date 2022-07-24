import 'package:flutter/material.dart';

import '../l10n/l10n.dart';

const _margin = EdgeInsets.symmetric(vertical: 8);

class SimpleTextField extends StatelessWidget {
  const SimpleTextField({
    super.key,
    required this.icon,
    required this.hint,
  });

  final IconData icon;
  final String hint;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return Container(
      margin: _margin,
      child: TextFormField(
        style: theme.textTheme.bodyText1,
        cursorColor: theme.primaryColor,
        textAlignVertical: TextAlignVertical.center,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return l10n.fillField;
          }
          return null;
        },
        decoration: InputDecoration(
          isCollapsed: true,
          prefixIcon: Icon(
            icon,
            color: theme.hintColor,
          ),
          // TODO: think up the way how to add a red star to huntText
          hintText: hint,
          hintStyle:
              theme.textTheme.bodyText1?.copyWith(color: theme.hintColor),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: theme.hintColor,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: theme.primaryColor,
            ),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: theme.errorColor,
            ),
          ),
        ),
      ),
    );
  }
}
