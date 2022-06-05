import 'package:flutter/material.dart';

import '../global_parameters.dart';
import '../widgets/secure_text_field.dart';
import '../widgets/simple_text_field.dart';
import '../widgets/single_button.dart';

class SignUpOverlay extends StatelessWidget {
  const SignUpOverlay({
    Key? key,
    required this.constraints,
  }) : super(key: key);

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    final passVisible = ValueNotifier<bool>(false);
    final repPassVisible = ValueNotifier<bool>(false);
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
              'Привет!',
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          const SizedBox(height: 10),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Создайте аккаунт для доступа к ',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                TextSpan(
                  text: 'Лекции',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ...[
            ['Эл. почта', Icons.mail, true],
          ].map<Widget>(
            (params) {
              return SimpleTextField(
                autoValidateMode: params[2] as bool,
                icon: params[1] as IconData,
                hint: params[0] as String,
              );
            },
          ),
          ...[
            ['Пароль', Icons.https, true, passVisible],
            ['Повторите пароль', Icons.https, true, repPassVisible],
          ].map<Widget>(
            (params) {
              return SecureTextField(
                autoValidateMode: params[2] as bool,
                icon: params[1] as IconData,
                hint: params[0] as String,
                obscure: params[3] as ValueNotifier<bool>,
              );
            },
          ),
          Expanded(
            flex: 5,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Уже есть аккаунт?',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  TextButton(
                    child: Text(
                      'Войти',
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                    ),
                    onPressed: () {
                      GlobalParameters.confirmOverlayNotifier.value = true;
                    },
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SingleButton(
              text: 'Далее',
              onPressed: () {
                GlobalParameters.confirmOverlayNotifier.value = true;
              },
            ),
          ),
        ],
      ),
    );
  }
}
