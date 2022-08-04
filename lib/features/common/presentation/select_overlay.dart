import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/measures.dart' as const_measures;
import '../../../l10n/l10n.dart';
import '../../../scope/app_scope.dart';
import 'widgets/drag_container.dart';
import 'widgets/search_bar.dart';
import 'widgets/select_item.dart';

const _heightFactor = 0.9;
const _padding = EdgeInsets.symmetric(
  horizontal: const_measures.mainHorMargin,
);
const _separator = SizedBox(
  height: 20.0,
);

void showSelectOverlay({
  required BuildContext context,
  required WidgetRef ref,
  // TODO: remove items, place some logic for API request
  required List<String> items,
  required void Function(String value) onChanged,
}) {
  final theme = Theme.of(context);
  final l10n = context.l10n;

  showModalBottomSheet<void>(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return FractionallySizedBox(
        heightFactor: _heightFactor,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: theme.scaffoldBackgroundColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(
                const_measures.overlayBorderRadius,
              ),
              topRight: Radius.circular(
                const_measures.overlayBorderRadius,
              ),
            ),
          ),
          child: Padding(
            padding: _padding,
            child: Column(
              children: [
                const DragContainer(),
                SearchBar(
                  hint: l10n.search,
                  onSubmitted: (query) {
                    // TODO: make request to server (use rx)
                    ref
                        .read(AppScope.get().loggerManager)
                        .log('$query requested');
                  },
                ),
                _separator,
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return SelectItem(
                        value: items[index],
                        onSelect: () {
                          onChanged(items[index]);
                          Navigator.of(context).pop();
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
