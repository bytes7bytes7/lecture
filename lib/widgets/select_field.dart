import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

class SelectField extends ConsumerWidget {
  const SelectField({
    super.key,
    required this.value,
    required this.onChanged,
    required this.hint,
    required this.items,
  });

  final String value;
  final void Function(String value) onChanged;
  final String hint;
  final List<String> items;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            child: (value.isNotEmpty)
                ? Text(
                    value,
                    style: theme.textTheme.bodyText1,
                  )
                : Text(
                    hint,
                    style: theme.textTheme.bodyText1
                        ?.copyWith(color: theme.hintColor),
                  ),
          ),
          SizedIconButton(
            icon: Icons.search,
            size: const_measures.smallIconSize,
            tooltip: const_tooltips.choose,
            onPressed: () async {
              showSelectOverlay(
                context: context,
                ref: ref,
                items: items,
                onChanged: onChanged,
              );
            },
          ),
        ],
      ),
    );
  }
}
