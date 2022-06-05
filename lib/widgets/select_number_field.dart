import 'package:flutter/material.dart';

import '../constants/tooltips.dart' as const_tooltips;
import '../global_parameters.dart';
import 'sized_icon_button.dart';

class SelectNumberField extends StatelessWidget {
  const SelectNumberField({
    Key? key,
    required this.title,
    required this.notifier,
    required this.defaultText,
    required this.min,
    required this.max,
  }) : super(key: key);

  /// Value of notifier must be [0-9]
  final ValueNotifier<String> notifier;
  final String title;
  final String defaultText;

  /// Value must be [min : max]
  final int min;
  final int max;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 12.0),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Theme.of(context).primaryColor,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          SizedIconButton(
            size: 24.0,
            icon: Icons.keyboard_arrow_left,
            onPressed: () {
              if (notifier.value.isEmpty) {
                notifier.value = max.toString();
              } else {
                try {
                  var old = int.parse(notifier.value);
                  if (old != min) {
                    notifier.value = (--old).toString();
                  }
                } catch (e) {
                  notifier.value = '';
                }
              }
              GlobalParameters.checkFilter();
            },
            message: const_tooltips.less,
          ),
          ValueListenableBuilder(
            valueListenable: notifier,
            builder: (context, String num, _) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  (notifier.value.isNotEmpty) ? num : defaultText,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              );
            },
          ),
          SizedIconButton(
            size: 24.0,
            icon: Icons.keyboard_arrow_right,
            onPressed: () {
              if (notifier.value.isEmpty) {
                notifier.value = min.toString();
              } else {
                try {
                  var old = int.parse(notifier.value);
                  if (old != max) {
                    notifier.value = (++old).toString();
                  }
                } catch (e) {
                  notifier.value = '';
                }
              }
              GlobalParameters.checkFilter();
            },
            message: const_tooltips.more,
          ),
        ],
      ),
    );
  }
}
