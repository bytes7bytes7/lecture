import 'package:flutter/material.dart';

const _margin = EdgeInsets.symmetric(vertical: 8);

class DefaultTextField extends StatelessWidget {
  const DefaultTextField({
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

    return Container(
      margin: _margin,
      child: TextFormField(
        controller: controller,
        keyboardType: inputType,
        enabled: enabled,
        style: theme.textTheme.bodyText1,
        textAlignVertical: TextAlignVertical.center,
        validator: validator,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: theme.hintColor,
          ),
          // TODO: think up the way how to add a red star to huntText
          hintText: hint,
        ),
      ),
    );
  }
}
