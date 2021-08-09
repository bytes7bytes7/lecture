import 'package:flutter/material.dart';

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
                  isCollapsed: true
              ),
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
                onPressed: () {},
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
