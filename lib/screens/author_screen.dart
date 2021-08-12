import 'package:flutter/material.dart';

import '../constants.dart';
import '../widgets/default_app_bar.dart';

class AuthorScreen extends StatelessWidget {
  const AuthorScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        prefix: Icons.arrow_back,
        prefixMessage: ConstantMessages.back,
        prefixOnPressed: () {
          Navigator.pop(context);
        },
        text: 'id32684510',
      ),
      body: Center(
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            switch (index) {
              case 0:
                return Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 15.0),
                      height: 76.0,
                      width: 76.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                        ),
                        image: const DecorationImage(
                          image: NetworkImage(
                              'https://img.youscreen.ru/wall/14977928959176/14977928959176_1920x1200.jpg'),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color:
                                Theme.of(context).shadowColor.withOpacity(0.25),
                            offset: const Offset(0, 4),
                            blurRadius: 10.0,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        'Иванов Алексей\nИгоревич',
                        style: Theme.of(context).textTheme.headline3,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Text(
                      '8 Лекций',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: Theme.of(context).hintColor),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20.0),
                  ],
                );
              default:
                return const SizedBox.shrink();
              //return LectureCard(lecture: lecture);
            }
          },
        ),
      ),
    );
  }
}
