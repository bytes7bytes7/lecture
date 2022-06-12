import 'package:flutter/material.dart';

import '../constants/measures.dart' as const_measures;
import '../constants/tooltips.dart' as const_tooltips;
import '../global_parameters.dart';
import 'sized_icon_button.dart';

const _margin = EdgeInsets.symmetric(
  horizontal: const_measures.mainHorMargin,
  vertical: 12.0,
);
const _padding = EdgeInsets.symmetric(
  horizontal: 20.0,
  vertical: 10.0,
);
const _textPadding = EdgeInsets.symmetric(horizontal: 20.0);

class SelectNumberField extends StatelessWidget {
  const SelectNumberField({
    Key? key,
    required this.title,
    required this.notifier,
    required this.defaultText,
    required this.min,
    required this.max,
  }) : super(key: key);

  /// Value of notifier must be 0-9 or -
  final ValueNotifier<String> notifier;
  final String title;
  final String defaultText;

  /// Value must be in range [min, max]
  final int min;
  final int max;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: _margin,
      padding: _padding,
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(
          const_measures.mainBorderRadius,
        ),
        border: Border.all(
          color: theme.primaryColor,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: theme.textTheme.bodyText1,
            ),
          ),
          SizedIconButton(
            icon: Icons.keyboard_arrow_left,
            size: const_measures.smallIconSize,
            tooltip: const_tooltips.less,
            onPressed: () {
              if (notifier.value != defaultText) {
                try {
                  var old = int.parse(notifier.value);
                  if (old != min) {
                    notifier.value = (--old).toString();
                  } else {
                    notifier.value = defaultText;
                  }
                } catch (e) {
                  notifier.value = defaultText;
                }
              }
              GlobalParameters.checkFilter();
            },
          ),
          ValueListenableBuilder(
            valueListenable: notifier,
            builder: (context, String num, child) {
              return Padding(
                padding: _textPadding,
                child: Text(
                  (notifier.value.isNotEmpty) ? num : defaultText,
                  style: theme.textTheme.bodyText1,
                ),
              );
            },
          ),
          SizedIconButton(
            icon: Icons.keyboard_arrow_right,
            size: const_measures.smallIconSize,
            tooltip: const_tooltips.more,
            onPressed: () {
              if (notifier.value != defaultText) {
                try {
                  var old = int.parse(notifier.value);
                  if (old != max) {
                    notifier.value = (++old).toString();
                  }
                } catch (e) {
                  notifier.value = defaultText;
                }
              } else {
                notifier.value = '$min';
              }
              GlobalParameters.checkFilter();
            },
          ),
        ],
      ),
    );
  }
}
