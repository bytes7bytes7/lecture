import 'package:flutter/material.dart';

import '../custom/custom_route_builder.dart';
import '../screens/home_screen.dart';
import '../widgets/simple_text_field.dart';
import '../widgets/single_button.dart';

class PersonalInfoOverlay extends StatelessWidget {
  const PersonalInfoOverlay({
    Key? key,
    required this.constraints,
  }) : super(key: key);

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: constraints.maxHeight,
      width: constraints.maxWidth,
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 30.0),
            child: Text(
              'Личное',
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Заполните следующие поля, чтобы другие пользователи могли Вас найти',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const SizedBox(height: 20),
          ...[
            ['Имя', Icons.person, true],
            ['Фамилия', Icons.person, true],
            ['Отчество', Icons.person, false],
          ].map<Widget>(
            (params) {
              return SimpleTextField(
                autoValidateMode: params[2] as bool,
                icon: params[1] as IconData,
                hint: params[0] as String,
              );
            },
          ),
          const Spacer(),
          Align(
            alignment: Alignment.center,
            child: SingleButton(
              text: 'Далее',
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  CustomRouteBuilder(
                    widget: const HomeScreen(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
