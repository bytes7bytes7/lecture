import 'package:flutter/material.dart';
import 'package:lecture/constants.dart';

import 'sized_icon_button.dart';

class SelectItemRow extends StatelessWidget {
  const SelectItemRow({
    Key? key,
    required this.hintText,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String hintText;
  final ValueNotifier<String> text;
  final VoidFunction onPressed;

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
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      border: Border.all(
                        color: Theme.of(context).focusColor,
                      ),
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
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Material(
                        child: InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    _value,
                                    style: _style,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                if (_value != hintText)
                                  SizedIconButton(
                                    icon: Icons.close,
                                    onPressed: () {
                                      text.value = '';
                                    },
                                    message: ConstantMessages.clear,
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15.0),
                MaterialButton(
                  child: const Icon(Icons.search),
                  onPressed: onPressed,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
