import 'package:flutter/material.dart';

import '../../../../constants/measures.dart' as const_measures;

const _padding = EdgeInsets.symmetric(
  horizontal: const_measures.midPadding,
  vertical: const_measures.smallPadding,
);

class ModTextField extends StatelessWidget {
  const ModTextField({
    super.key,
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
  final TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      enabled: enabled,
      textAlignVertical: TextAlignVertical.center,
      style: theme.textTheme.bodyText1,
      cursorColor: theme.primaryColor,
      validator: validator,
      decoration: InputDecoration(
        isCollapsed: true,
        hintText: hint,
        contentPadding: _padding,
        suffixIcon: Icon(
          icon,
          color: theme.hintColor,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            const_measures.mainBorderRadius,
          ),
          borderSide: BorderSide(
            color: theme.hintColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            const_measures.mainBorderRadius,
          ),
          borderSide: BorderSide(
            color: theme.primaryColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            const_measures.mainBorderRadius,
          ),
          borderSide: BorderSide(
            color: theme.errorColor,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            const_measures.mainBorderRadius,
          ),
          borderSide: BorderSide(
            color: theme.errorColor,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            const_measures.mainBorderRadius,
          ),
          borderSide: BorderSide(
            color: theme.disabledColor,
          ),
        ),
      ),
    );
  }
}
