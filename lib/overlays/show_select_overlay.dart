import 'package:flutter/material.dart';

import '../widgets/search_bar.dart';
import '../widgets/drag_container.dart';

void showSelectOverlay(
  BuildContext context,
) {
  Size size = MediaQuery.of(context).size;
  showModalBottomSheet<void>(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    constraints: BoxConstraints(maxHeight: size.height * 0.9),
    builder: (BuildContext context) {
      return Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: Center(
          child: Column(
            children: const <Widget>[
              DragContainer(),
              SearchBar(),
            ],
          ),
        ),
      );
    },
  );
}
