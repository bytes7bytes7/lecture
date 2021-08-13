import 'package:flutter/material.dart';
import 'package:lecture/custom/custom_route_builder.dart';
import 'package:lecture/screens/home_screen.dart';
import 'package:lecture/widgets/single_button.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController _pageController = PageController();
    final double fullHeight = MediaQuery.of(context).size.height;
    final EdgeInsets padding = MediaQuery.of(context).padding;
    return Container(
      color: Theme.of(context).primaryColor,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: SizedBox(
                height: fullHeight - padding.top - padding.bottom,
                child: Column(
                  children: [
                    Flexible(
                      child: Align(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .fontSize,
                              width: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .fontSize,
                              child: Image.asset(
                                  'assets/images/ic_launcher_96.png'),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              'Лекция',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child:PageView.builder(
                        physics: const BouncingScrollPhysics(),
                        controller: _pageController,
                        itemBuilder: (context, index) {
                          return Container(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 25.0),
                            decoration: BoxDecoration(
                              color:
                              Theme.of(context).scaffoldBackgroundColor,
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
                                    style:
                                    Theme.of(context).textTheme.headline2,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                        'Создайте аккаунт для доступа к ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ),
                                      TextSpan(
                                        text: 'Лекции',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20),
                                ...[
                                  ['Эл. почта', Icons.mail, true],
                                  ['Имя', Icons.person, true],
                                  ['Фамилия', Icons.person, true],
                                  ['Отчество', Icons.person, false],
                                  ['Пароль', Icons.https, true],
                                  ['Повторите пароль', Icons.https, true],
                                ].map<Widget>(
                                      (pair) {
                                    return Expanded(
                                      child: TextFormField(
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                        cursorColor:
                                        Theme.of(context).primaryColor,
                                        textAlignVertical:
                                        TextAlignVertical.center,
                                        autovalidateMode: (pair[2] as bool)
                                            ? AutovalidateMode
                                            .onUserInteraction
                                            : AutovalidateMode.disabled,
                                        validator: (value) {
                                          if (value == null ||
                                              value.isEmpty) {
                                            return 'Заполните поле';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(
                                            pair[1] as IconData,
                                            color:
                                            Theme.of(context).hintColor,
                                          ),
                                          hintText: pair[0] as String,
                                          hintStyle: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .copyWith(
                                              color: Theme.of(context)
                                                  .hintColor),
                                          isCollapsed: true,
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                              Theme.of(context).hintColor,
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Уже есть аккаунт?',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1,
                                    ),
                                    TextButton(
                                      child: Text(
                                        'Войти',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1!
                                            .copyWith(
                                          decoration:
                                          TextDecoration.underline,
                                        ),
                                      ),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: SingleButton(
                                    text: 'Далее',
                                    onPressed: () {
                                      Overlay.of(context).
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
