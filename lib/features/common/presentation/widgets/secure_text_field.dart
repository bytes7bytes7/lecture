import 'package:flutter/material.dart';

import '../../../../constants/measures.dart' as const_measures;
import '../../../../l10n/l10n.dart';
import 'sized_icon_button.dart';

const _margin = EdgeInsets.symmetric(vertical: 8);

class SecureTextField extends StatelessWidget {
  const SecureTextField({
    super.key,
    required this.obscure,
    this.icon,
    this.hint,
    this.enabled,
    this.controller,
    this.validator,
    this.inputType,
  });

  final IconData? icon;
  final String? hint;
  final bool? enabled;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final ValueNotifier<bool> obscure;
  final TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return Container(
      margin: _margin,
      child: ValueListenableBuilder(
        valueListenable: obscure,
        builder: (context, bool value, child) {
          return TextFormField(
            controller: controller,
            keyboardType: inputType,
            enabled: enabled,
            style: theme.textTheme.bodyText1,
            cursorColor: theme.primaryColor,
            textAlignVertical: TextAlignVertical.center,
            validator: validator,
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
                tooltip: value ? l10n.tooltipShow : l10n.tooltipHide,
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
