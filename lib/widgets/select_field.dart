import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/measures.dart' as const_measures;
import '../overlays/show_select_overlay.dart';

const _margin = EdgeInsets.symmetric(
  vertical: const_measures.mainVerMargin,
);
const _padding = EdgeInsets.symmetric(
  horizontal: const_measures.midPadding,
  vertical: const_measures.smallPadding,
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
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(
          const_measures.mainBorderRadius,
        ),
        border: Border.all(
          color: theme.primaryColor,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          const_measures.mainBorderRadius,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              showSelectOverlay(
                context: context,
                ref: ref,
                items: items,
                onChanged: onChanged,
              );
            },
            child: Padding(
              padding: _padding,
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
                  const Icon(
                    Icons.search,
                    size: const_measures.smallIconSize,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
