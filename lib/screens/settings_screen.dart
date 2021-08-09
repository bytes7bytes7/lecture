import 'package:flutter/material.dart';

import '../widgets/leading_icon_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        // TODO: fix appbar padding
        titleSpacing: 20.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LeadingIconButton(
              icon: Icons.arrow_back,
              color: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Text(
              'id23450160',
              style: Theme.of(context).textTheme.headline2,
            ),
            LeadingIconButton(
              icon: Icons.exit_to_app,
              color: Theme.of(context).primaryColor,
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
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
                ),
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
            MaterialButton(
              padding: const EdgeInsets.all(0),
              minWidth: 0,
              onPressed: () {},
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.brightness_6_rounded,
                      color: Theme.of(context).primaryColor,
                      size: 24.0,
                    ),
                    const SizedBox(width: 15.0),
                    Text(
                      'Тема приложения',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              color: Theme.of(context).hintColor,
              thickness: 1.0,
              indent: 25.0,
              endIndent: 25.0,
              height: 1,
            ),
            MaterialButton(
              padding: const EdgeInsets.all(0),
              minWidth: 0,
              onPressed: () {},
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.bookmark,
                      color: Theme.of(context).primaryColor,
                      size: 24.0,
                    ),
                    const SizedBox(width: 15.0),
                    Text(
                      'Сохраненное',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 4),
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
              ),
            ),
            Divider(
              color: Theme.of(context).hintColor,
              thickness: 1.0,
              indent: 25.0,
              endIndent: 25.0,
              height: 1,
            ),
            MaterialButton(
              padding: const EdgeInsets.all(0),
              minWidth: 0,
              onPressed: () {},
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.insert_drive_file,
                      color: Theme.of(context).primaryColor,
                      size: 24.0,
                    ),
                    const SizedBox(width: 15.0),
                    Text(
                      'Мои лекции',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 4),
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
              ),
            ),
            const Spacer(),
            MaterialButton(
              padding: const EdgeInsets.only(bottom: 25.0),
              minWidth: 0,
              onPressed: () {},
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.info,
                      color: Theme.of(context).primaryColor,
                      size: 24.0,
                    ),
                    const SizedBox(width: 15.0),
                    Text(
                      'О приложении',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
