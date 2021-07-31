import 'package:flutter/material.dart';

import 'rounded_icon_button.dart';

class SliverSearchBar extends StatelessWidget {
  const SliverSearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      snap: true,
      floating: true,
      expandedHeight: 75,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      flexibleSpace: Container(
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Row(
          children: [
            Flexible(
              flex: 4,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                width: double.infinity,
                height: 42.0,
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(color: Theme.of(context).focusColor),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).focusColor.withOpacity(0.25),
                      offset: const Offset(0, 3),
                      spreadRadius: 0,
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: TextField(
                  // controller: searchController,
                  style: Theme.of(context).textTheme.bodyText2,
                  scrollPhysics: const BouncingScrollPhysics(),
                  decoration: InputDecoration(
                    hintText: 'Поиск ...',
                    hintStyle: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: Theme.of(context).focusColor),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10.0),
            Flexible(
              child: RoundedIconButton(
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
