import 'dart:convert';

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
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(lecture.items.length, (index) {
                String title = lecture.fieldsRU[index];
                dynamic item = lecture.items[index];
                if(item is Map){
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      children: [
                        RichText(
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
                                text: '${item['text']}',
                                style: Theme.of(context).textTheme.bodyText1!,
                              ),
                            ],
                          ),
                        ),
                        for(int i =0 ; i< item['photos'].length; i ++)
                        SizedBox(
                          width: double.infinity,
                          child: Image.memory(base64Decode(item['photos'][i])),
                        ),
                      ],
                    ),
                  );
                }else if(item is double){
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
                            text: ((item*100).round()/100).toString(),
                            style: Theme.of(context).textTheme.bodyText1!,
                          ),
                        ],
                      ),
                    ),
                  );
                }
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
      ),
    );
  }
}
