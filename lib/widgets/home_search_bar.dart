import 'package:flutter/material.dart';
import 'package:lecture/constants.dart';
import 'package:lecture/widgets/sized_icon_button.dart';

import 'drag_container.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25.0),
      height: 57.0,
      decoration: BoxDecoration(
        color: Theme.of(context).disabledColor,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: Theme.of(context).primaryColor,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              scrollPhysics: const BouncingScrollPhysics(),
              textAlignVertical: TextAlignVertical.center,
              style: Theme.of(context).textTheme.bodyText1,
              cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Theme.of(context).hintColor,
                    size: 24.0,
                  ),
                  hintText: 'Поиск',
                  hintStyle: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Theme.of(context).hintColor,
                      ),
                  border: InputBorder.none,
                  isCollapsed: true),
            ),
          ),
          Container(
            height: 57.0,
            width: 57.0,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(18.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18.0),
              child: MaterialButton(
                padding: const EdgeInsets.all(0),
                minWidth: 0,
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 200,
                        color: const Color(0xFF737373),
                        child: Container(
                          height: 200,
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
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 25.0, vertical: 12.0),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 10.0),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Физико-технический факультет',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                      ),
                                      SizedIconButton(
                                        icon: Icons.search,
                                        onPressed: () {},
                                        message: ConstantMessages.choose,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Icon(
                  Icons.tune,
                  color: Theme.of(context).scaffoldBackgroundColor,
                  size: 24.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
