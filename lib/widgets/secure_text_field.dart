import 'package:flutter/material.dart';

import '../constants/measures.dart' as const_measures;
import '../constants/tooltips.dart' as const_tooltips;
import 'sized_icon_button.dart';

const _margin = EdgeInsets.symmetric(vertical: 8);

class SecureTextField extends StatelessWidget {
  const SecureTextField({
    Key? key,
    required this.icon,
    required this.hint,
    required this.obscure,
  }) : super(key: key);

  final IconData icon;
  final String hint;
  final ValueNotifier<bool> obscure;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: _margin,
      child: ValueListenableBuilder(
        valueListenable: obscure,
        builder: (context, bool value, child) {
          return TextFormField(
            style: theme.textTheme.bodyText1,
            cursorColor: theme.primaryColor,
            textAlignVertical: TextAlignVertical.center,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Заполните поле';
              }

              return null;
            },
            obscureText: value,
            decoration: InputDecoration(
              isCollapsed: true,
              prefixIcon: Icon(
                icon,
                color: theme.hintColor,
              ),
              suffixIcon: SizedIconButton(
                icon: value ? Icons.visibility : Icons.visibility_off,
                size: const_measures.smallIconSize,
                tooltip: const_tooltips.obscure,
                onPressed: () {
                  obscure.value = !obscure.value;
                },
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
          );
        },
      ),
    );
  }
}
