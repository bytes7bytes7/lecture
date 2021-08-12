import 'package:flutter/material.dart';

import '../widgets/search_bar.dart';
import '../widgets/drag_container.dart';
import '../global_parameters.dart';

void showSelectOverlay({
  required BuildContext context,
  required List<String> items,
  required ValueNotifier<String> notifier,
}) {
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
            children: <Widget>[
              const DragContainer(),
              const SearchBar(),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 10.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color:
                                Theme.of(context).shadowColor.withOpacity(0.25),
                            offset: const Offset(0, 4),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: MaterialButton(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15.0),
                          minWidth: 0,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              items[index],
                              style: Theme.of(context).textTheme.bodyText1,
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
