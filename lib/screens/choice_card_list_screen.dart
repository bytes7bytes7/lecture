import 'package:flutter/material.dart';

import '../test_data.dart';

class ChoiceCardListScreen extends StatelessWidget {
  const ChoiceCardListScreen({
    Key? key,
    required this.level,
    required this.data,
  }) : super(key: key);

  final int level;
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    final String title = TestData.testTitles[level];
    List<dynamic> items = [];
    if (data is Map) {
      items = data.keys.toList();
      try {
        items = items.map<int>((e) => int.parse(e)).toList();
      } catch (e) {
        //
      }
    } else {
      items = List<String>.from(data);
    }
    items.sort();
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: items.length,
          itemBuilder: (context, index) {
            dynamic nextData = [];
            if (data is Map) {
              nextData = data[items[index].toString()];
            }
            return Card(
              child: ListTile(
                contentPadding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
                title: Text(
                  '${items[index]}',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                onTap: (nextData.isNotEmpty)
                    ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChoiceCardListScreen(
                        level: level + 1,
                        data: nextData,
                      ),
                    ),
                  );
                }
                    : () {},
              ),
            );
          },
        ),
      ),
    );
  }
}
