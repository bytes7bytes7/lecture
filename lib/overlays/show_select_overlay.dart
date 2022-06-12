import 'package:flutter/material.dart';
import 'package:quick_quotes_quill/spread_quill_manager.dart';

import '../constants/measures.dart' as const_measures;
import '../global_parameters.dart';
import '../widgets/drag_container.dart';
import '../widgets/search_bar.dart';

const _heightFactor = 0.9;
const _itemMargin = EdgeInsets.symmetric(
  horizontal: const_measures.mainHorMargin,
  vertical: 10.0,
);
const _offset = Offset(0, 4);
const _blurRadius = 8.0;
const _textPadding = EdgeInsets.symmetric(
  horizontal: 20.0,
  vertical: 15.0,
);

void showSelectOverlay({
  required BuildContext context,
  required List<String> items,
  required ValueNotifier<String> notifier,
}) {
  final theme = Theme.of(context);
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
        child: Center(
          child: Column(
            children: [
              const DragContainer(),
              SearchBar(
                hint: 'Поиск',
                onSubmitted: (query) {
                  // TODO: make request to server (use rx)
                  SpreadQuillManager.inst.log('$query requested');
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
                              const_measures.opacity,
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
                            notifier.value = items[index];
                            GlobalParameters.checkFilter();
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
