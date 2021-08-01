import 'package:flutter/material.dart';

import '../models/lecture.dart';

class LectureScreen extends StatelessWidget {
  const LectureScreen({
    Key? key,
    required this.lecture,
  }) : super(key: key);

  final Lecture lecture;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: Text(
          lecture.topic,
          style: Theme.of(context).textTheme.headline1,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_outlined),
          color: Theme.of(context).focusColor,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(lecture.items.length, (index) {
              String title = lecture.fieldsRU[index];
              dynamic item = lecture.items[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '$title: ',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: Theme.of(context).disabledColor),
                      ),
                      TextSpan(
                        text: '$item',
                        style: Theme.of(context).textTheme.bodyText1!,
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
