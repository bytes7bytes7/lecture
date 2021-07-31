import 'package:flutter/material.dart';

import '../widgets/search_bar.dart';

class SelectScreen extends StatelessWidget {
  const SelectScreen({
    Key? key,
    required this.title,
    required this.items,
  }) : super(key: key);

  final String title;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  children: const [
                    SearchBar(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 8.0,
                      ),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Theme.of(context).focusColor,
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(18),
                          child: Text(
                            items[index],
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(color: Theme.of(context).focusColor),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
