import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/measures.dart' as const_measures;
import '../l10n/l10n.dart';
import '../overlays/show_filter_overlay.dart';
import 'sized_icon_button.dart';

const _height = 56.0;
const _margin = EdgeInsets.symmetric(
  horizontal: const_measures.mainHorMargin,
  vertical: 15.0,
);
const _borderRadius = 20.0;
const _buttonBorderRadius = 18.0;

class HomeSearchBar extends ConsumerWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return Container(
      height: _height,
      margin: _margin,
      decoration: BoxDecoration(
        color: theme.disabledColor,
        borderRadius: BorderRadius.circular(_borderRadius),
        border: Border.all(
          color: theme.primaryColor,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              scrollPhysics: const BouncingScrollPhysics(),
              textAlignVertical: TextAlignVertical.center,
              style: theme.textTheme.bodyText1,
              cursorColor: theme.primaryColor,
              decoration: InputDecoration(
                isCollapsed: true,
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.search,
                  color: theme.hintColor,
                  size: const_measures.smallIconSize,
                ),
                hintText: l10n.search,
                hintStyle: theme.textTheme.subtitle1?.copyWith(
                  color: theme.hintColor,
                ),
              ),
            ),
          ),
          Container(
            height: _height,
            width: _height,
            decoration: BoxDecoration(
              color: theme.primaryColor,
              borderRadius: BorderRadius.circular(_buttonBorderRadius),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(_buttonBorderRadius),
              child: SizedIconButton(
                icon: Icons.tune,
                size: const_measures.smallIconSize,
                tooltip: l10n.tooltipFilter,
                color: theme.scaffoldBackgroundColor,
                onPressed: () {
                  showFilterOverlay(context: context, ref: ref);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
