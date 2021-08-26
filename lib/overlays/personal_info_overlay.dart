import 'package:flutter/material.dart';

import '../custom/overlay_viewer.dart';
import '../widgets/single_button.dart';
import 'confirm_overlay.dart';

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
              return Expanded(
                child: TextFormField(
                  style: Theme.of(context).textTheme.bodyText1,
                  cursorColor: Theme.of(context).primaryColor,
                  textAlignVertical: TextAlignVertical.center,
                  autovalidateMode: (params[2] as bool)
                      ? AutovalidateMode.onUserInteraction
                      : AutovalidateMode.disabled,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Заполните поле';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      params[1] as IconData,
                      color: Theme.of(context).hintColor,
                    ),
                    // TODO: think up the way how to add a red star to huntText
                    hintText: params[0] as String,
                    hintStyle: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Theme.of(context).hintColor),
                    isCollapsed: true,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.center,
            child: SingleButton(
              text: 'Далее',
              onPressed: () {
                // Navigator.of(context).push(
                //   CustomRouteBuilder(
                //     widget: const HomeScreen(),
                //   ),
                // );
              },
            ),
          ),
        ],
      ),
    );
  }
}
