import 'package:flutter/material.dart';

import '../screens/filter_screen.dart';
import 'rounded_button.dart';

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
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Row(
            children: [
              Flexible(
                flex: 4,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  width: double.infinity,
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
                    style: Theme.of(context).textTheme.bodyText1,
                    scrollPhysics: const BouncingScrollPhysics(),
                    decoration: InputDecoration(
                      hintText: 'Поиск ...',
                      hintStyle: Theme.of(context).textTheme.bodyText1,
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 15.0),
              RoundedButton(
                data: Icons.filter_alt_outlined,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const FilterScreen();
                    },
                  ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
