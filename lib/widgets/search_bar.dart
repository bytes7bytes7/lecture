import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 12.0),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Theme.of(context).primaryColor,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Поиск',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Theme.of(context).hintColor),
            ),
          ),
          Icon(
            Icons.search,
            color: Theme.of(context).primaryColor,
            size: 24.0,
          ),
        ],
      ),
    );
  }
}
