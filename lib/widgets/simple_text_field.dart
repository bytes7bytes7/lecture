import 'package:flutter/material.dart';

const _margin = EdgeInsets.symmetric(vertical: 8);

class SimpleTextField extends StatelessWidget {
  const SimpleTextField({
    super.key,
    this.icon,
    this.hint,
    this.controller,
    this.validator,
  });

  final IconData? icon;
  final String? hint;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: _margin,
      child: TextFormField(
        controller: controller,
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
