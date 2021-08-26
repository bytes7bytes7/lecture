import 'package:flutter/material.dart';

class SimpleTextField extends StatelessWidget {
  const SimpleTextField({
    Key? key,
    required this.autoValidateMode,
    required this.icon,
    required this.hint,
  }) : super(key: key);

  final bool autoValidateMode;
  final IconData icon;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        style: Theme.of(context).textTheme.bodyText1,
        cursorColor: Theme.of(context).primaryColor,
        textAlignVertical: TextAlignVertical.center,
        autovalidateMode: autoValidateMode
            ? AutovalidateMode.onUserInteraction
            : AutovalidateMode.disabled,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Заполните поле';
          }
          return null;
        },
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Theme.of(context).hintColor,
          ),
          // TODO: think up the way how to add a red star to huntText
          hintText: hint,
          hintStyle: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: Theme.of(context).hintColor),
          isCollapsed: true,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).hintColor,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
