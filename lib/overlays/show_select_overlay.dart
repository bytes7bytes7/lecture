import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/measures.dart' as const_measures;
import '../features/common/common.dart';
import '../l10n/l10n.dart';
import '../scope/app_scope.dart';

const _heightFactor = 0.9;
const _itemMargin = EdgeInsets.symmetric(
  horizontal: const_measures.mainHorMargin,
  vertical: 10.0,
);
const _offset = Offset(0, 4);
const _blurRadius = 8.0;
const _padding = EdgeInsets.symmetric(
  horizontal: const_measures.mainHorMargin,
);
const _textPadding = EdgeInsets.symmetric(
  horizontal: 20.0,
  vertical: 15.0,
);

void showSelectOverlay({
  required BuildContext context,
  required WidgetRef ref,
  required List<String> items,
  required void Function(String value) onChanged,
}) {
  final theme = Theme.of(context);
  final l10n = context.l10n;
  final size = MediaQuery.of(context).size;

  showModalBottomSheet<void>(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    constraints: BoxConstraints(
      maxHeight: _heightFactor * size.height,
    ),
    builder: (BuildContext context) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(const_measures.overlayBorderRadius),
            topRight: Radius.circular(const_measures.overlayBorderRadius),
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
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: _itemMargin,
                      decoration: BoxDecoration(
                        color: theme.scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(
                          const_measures.mainBorderRadius,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: theme.shadowColor.withOpacity(
                              const_measures.smallOpacity,
                            ),
                            offset: _offset,
                            blurRadius: _blurRadius,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          const_measures.mainBorderRadius,
                        ),
                        child: MaterialButton(
                          padding: _textPadding,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              items[index],
                              style: theme.textTheme.bodyText1,
                            ),
                          ),
                          onPressed: () {
                            onChanged(items[index]);
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
