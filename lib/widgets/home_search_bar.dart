import 'package:flutter/material.dart';

import '../constants/measures.dart' as const_measures;
import '../constants/tooltips.dart' as const_tooltips;
import '../overlays/show_filter_overlay.dart';
import 'sized_icon_button.dart';

const _height = 56.0;
const _margin = EdgeInsets.symmetric(
  horizontal: const_measures.mainHorMargin,
  vertical: 15.0,
);
const _borderRadius = 20.0;
const _buttonBorderRadius = 18.0;

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
                hintText: 'Поиск',
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
                tooltip: const_tooltips.filter,
                color: theme.scaffoldBackgroundColor,
                onPressed: () {
                  showFilterOverlay(context: context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
