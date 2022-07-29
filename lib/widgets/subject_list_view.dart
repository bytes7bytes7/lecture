import 'package:flutter/material.dart';
import 'package:rest_client/rest_client.dart';

import '../constants/measures.dart' as const_measures;

const _maxHeight = 185.0;
const _itemWidth = 110.0;
const _blurRadius = 10.0;
const _maxLines = 3;
const _offset = Offset(0, 4);
const _buttonPadding = EdgeInsets.all(25.0);
const _separator = SizedBox(width: 25.0);

// TODO: add this widget, when the logic (client & server) appears
class SubjectListView extends StatelessWidget {
  const SubjectListView({
    super.key,
    required this.items,
  });

  final List<Subject> items;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return LimitedBox(
      maxHeight: _maxHeight,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (context, index) {
          return _separator;
        },
        itemBuilder: (context, index) {
          return Container(
            width: _itemWidth,
            margin: EdgeInsets.only(
              left: index == 0 ? const_measures.mainHorMargin : 0,
              right:
                  index == items.length - 1 ? const_measures.mainHorMargin : 0,
              top: 5,
            ),
            child: Column(
              children: [
                Container(
                  height: _itemWidth,
                  width: _itemWidth,
                  decoration: BoxDecoration(
                    color: theme.scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(
                      const_measures.mainBorderRadius,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: theme.shadowColor
                            .withOpacity(const_measures.smallOpacity),
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
                      padding: _buttonPadding,
                      onPressed: () {},
                      child: Image.asset(items[index].url),
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  items[index].title,
                  style: theme.textTheme.bodyText1,
                  maxLines: _maxLines,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
                const Spacer(),
              ],
            ),
          );
        },
      ),
    );
  }
}
