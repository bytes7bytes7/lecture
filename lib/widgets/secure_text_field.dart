import 'package:flutter/material.dart';

import '../constants.dart';
import 'sized_icon_button.dart';

class SecureTextField extends StatelessWidget {
  const SecureTextField({
    Key? key,
    required this.autoValidateMode,
    required this.icon,
    required this.hint,
    required this.obscure,
  }) : super(key: key);

  final bool autoValidateMode;
  final IconData icon;
  final String hint;
  final ValueNotifier<bool> obscure;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ValueListenableBuilder(
        valueListenable: obscure,
        builder: (context, bool value, _) {
          return TextFormField(
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
            obscureText: !value,
            decoration: InputDecoration(
              prefixIcon: Icon(
                icon,
                color: Theme.of(context).hintColor,
              ),
              suffixIcon: SizedIconButton(
                size: 24.0,
                icon: value ? Icons.visibility : Icons.visibility_off,
                onPressed: () {
                  obscure.value = !obscure.value;
                },
                message: ConstantMessages.obscure,
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
          );
        },
      ),
    );
  }
}
