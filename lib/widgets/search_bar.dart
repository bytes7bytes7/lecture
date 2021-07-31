import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      height: 40.0,
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
    );
  }
}
