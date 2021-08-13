import 'package:flutter/material.dart';

import '../custom/custom_route_builder.dart';
import '../screens/authentication_screen.dart';
import '../widgets/double_button.dart';
import '../widgets/drag_container.dart';

void showBottomOverlay(
  BuildContext context,
) {
  showModalBottomSheet<void>(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      // TODO: find way to dynamically change size
      return Container(
        height: 250,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: Center(
          child: Column(
            children: <Widget>[
              const DragContainer(),
              const Spacer(),
              RichText(
                softWrap: true,
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: '😐\n\n',
                      style: TextStyle(fontSize: 30),
                    ),
                    TextSpan(
                      text: 'Вы действительно хотите ',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    TextSpan(
                      text: 'выйти',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(color: Theme.of(context).errorColor),
                    ),
                    TextSpan(
                      text: '\nиз учетной записи?',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              DoubleButton(
                prefix: 'Отмена',
                prefixOnPressed: () {
                  Navigator.pop(context);
                },
                suffix: 'Выйти',
                suffixOnPressed: () {
                  Navigator.pushReplacement(
                    context,
                    CustomRouteBuilder(widget: const AuthenticationScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}
