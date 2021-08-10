import 'package:flutter/material.dart';
import 'package:lecture/constants.dart';

import '../custom/custom_dropdown_button_form_field.dart';
import 'sized_icon_button.dart';

class PopupItemRow extends StatelessWidget {
  const PopupItemRow({
    Key? key,
    required this.hintText,
    required this.text,
    required this.itemCount,
  }) : super(key: key);

  final String hintText;
  final ValueNotifier<String> text;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: text,
      builder: (context, String value, __) {
        String _value = hintText;
        TextStyle _style = Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(color: Theme.of(context).disabledColor);
        if (value.isNotEmpty) {
          _value = value;
          _style = Theme.of(context).textTheme.bodyText1!;
        }
        return Tooltip(
          message: _value,
          showDuration: const Duration(seconds: 2),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          textStyle: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: Theme.of(context).scaffoldBackgroundColor),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              children: [
                Flexible(
                  flex: 4,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).focusColor.withOpacity(0.25),
                          offset: const Offset(0, 3),
                          spreadRadius: 0,
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: CustomDropdownButtonFormField(
                      icon: (_value != hintText)
                          ? SizedIconButton(
                              icon: Icons.close,
                              onPressed: () {
                                text.value = '';
                              },
                              message: ConstantMessages.clear,
                            )
                          : const SizedBox.shrink(),
                      style: Theme.of(context).textTheme.bodyText1,
                      decoration: InputDecoration(
                        hintText: hintText,
                        hintStyle: _style,
                        isCollapsed: true,
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 20),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide(
                            color: Theme.of(context).focusColor,
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        if (value.toString() != text.value) {
                          text.value = value.toString();
                        }
                      },
                      menuMaxHeight: 150,
                      value: (text.value.isNotEmpty)
                          ? int.parse(text.value)
                          : null,
                      items: List.generate(
                        itemCount,
                        (index) {
                          return DropdownMenuItem(
                            child: Text('${index + 1} $hintText'),
                            value: index + 1,
                          );
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15.0),
                const Flexible(
                  child: SizedBox(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
