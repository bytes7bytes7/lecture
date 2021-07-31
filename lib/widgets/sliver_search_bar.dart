import 'package:flutter/material.dart';
import 'package:lecture/widgets/search_bar.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Row(
            children: [
              const Flexible(
                flex: 4,
                child: SearchBar(),
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
