import 'package:flutter/material.dart';
import 'package:lecture/test_data.dart';
import 'package:lecture/themes/light_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const int level = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lecture',
      theme: lightTheme,
      home: const ChoiceCardList(
        level: level,
        data: TestData.testJson,
      ),
    );
  }
}

class ChoiceCardList extends StatelessWidget {
  const ChoiceCardList({
    Key? key,
    required this.level,
    required this.data,
  }) : super(key: key);

  final int level;
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    final String title = TestData.testTitles[level];
    List<String> items = [];
    if (data is Map) {
      items = data.keys.toList();
    } else {
      items = List<String>.from(data);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            dynamic nextData = [];
            if (data is Map) {
              nextData = data[items[index]];
            }
            return Card(
              child: ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
                title: Text(
                  items[index],
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                onTap: (nextData.isNotEmpty)
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChoiceCardList(
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
