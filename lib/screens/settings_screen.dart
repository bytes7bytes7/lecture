import 'package:flutter/material.dart';

import '../constants.dart';
import '../custom/custom_route_builder.dart';
import '../screens/bookmark_screen.dart';
import '../screens/my_lectures_screen.dart';
import '../widgets/default_app_bar.dart';
import '../widgets/icon_text_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
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
        text: 'id16520468',
        suffix: Icons.exit_to_app,
        suffixMessage: ConstantMessages.exit,
        suffixOnPressed: () {},
      ),
      body: Center(
        child: Column(
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
                      'https://www.topsunglasses.net/wp-content/uploads/2016/10/Polarized-Sunglasses-for-Men-Photos.jpg'),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).shadowColor.withOpacity(0.25),
                    offset: const Offset(0, 4),
                    blurRadius: 10.0,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                'Соколов Владимир',
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            const SizedBox(height: 20.0),
            IconTextButton(
              icon: Icons.person,
              text: 'Аккаунт',
              onPressed: () {},
            ),
            Divider(
              color: Theme.of(context).hintColor,
              thickness: 1.0,
              indent: 25.0,
              endIndent: 25.0,
              height: 1,
            ),
            IconTextButton(
              icon: Icons.brightness_6_rounded,
              text: 'Тема приложения',
              onPressed: () {},
            ),
            Divider(
              color: Theme.of(context).hintColor,
              thickness: 1.0,
              indent: 25.0,
              endIndent: 25.0,
              height: 1,
            ),
            IconTextButton(
              icon: Icons.bookmark,
              text: 'Сохраненное',
              onPressed: () {
                Navigator.of(context).push(
                  CustomRouteBuilder(
                    widget: const BookmarkScreen(),
                  ),
                );
              },
              actions: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    '7',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: Theme.of(context).primaryColor),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Divider(
              color: Theme.of(context).hintColor,
              thickness: 1.0,
              indent: 25.0,
              endIndent: 25.0,
              height: 1,
            ),
            IconTextButton(
              icon: Icons.insert_drive_file,
              text: 'Мои лекции',
              onPressed: () {
                Navigator.of(context).push(
                  CustomRouteBuilder(
                    widget: const MyLecturesScreen(),
                  ),
                );
              },
              actions: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    '3',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: Theme.of(context).primaryColor),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: IconTextButton(
                icon: Icons.info,
                text: 'О приложении',
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
