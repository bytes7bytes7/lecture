import 'package:flutter/material.dart';

import '../constants/measures.dart' as const_measures;
import '../constants/tooltips.dart' as const_tooltips;
import '../overlays/show_select_overlay.dart';
import 'sized_icon_button.dart';

const _margin = EdgeInsets.symmetric(
  horizontal: const_measures.mainHorMargin,
  vertical: 12.0,
);
const _padding = EdgeInsets.symmetric(
  horizontal: 20.0,
  vertical: 10.0,
);

class SelectField extends StatelessWidget {
  const SelectField({
    Key? key,
    required this.notifier,
    required this.defaultText,
    required this.items,
  }) : super(key: key);

  final ValueNotifier<String> notifier;
  final String defaultText;
  final List<String> items;

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
          ValueListenableBuilder(
            valueListenable: notifier,
            builder: (context, String value, child) {
              return Expanded(
                child: (value.isNotEmpty)
                    ? Text(
                        value,
                        style: theme.textTheme.bodyText1,
                      )
                    : Text(
                        defaultText,
                        style: theme.textTheme.bodyText1
                            ?.copyWith(color: theme.hintColor),
                      ),
              );
            },
          ),
          SizedIconButton(
            icon: Icons.search,
            size: const_measures.smallIconSize,
            tooltip: const_tooltips.choose,
            onPressed: () async {
              showSelectOverlay(
                context: context,
                items: items,
                notifier: notifier,
              );
            },
          ),
        ],
      ),
    );
  }
}
