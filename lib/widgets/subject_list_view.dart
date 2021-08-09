import 'package:flutter/material.dart';

class SubjectListView extends StatelessWidget {
  const SubjectListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: 155,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        separatorBuilder: (context, index) {
          return const SizedBox(width: 25.0);
        },
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(
              left: index == 0 ? 25.0 : 0,
              right: index == 5 ? 25.0 : 0,
              top: 5,
            ),
            width: 100,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(9.0),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context)
                            .shadowColor
                            .withOpacity(0.25),
                        offset: const Offset(0, 4),
                        blurRadius: 10.0,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(9.0),
                    child: MaterialButton(
                      padding: const EdgeInsets.all(25.0),
                      minWidth: 0,
                      onPressed: () {},
                      child: Image.asset('assets/images/subjects/russian.png'),
                    ),
                  ),
                ),
                Text(
                  'Русский язык',
                  style: Theme.of(context).textTheme.bodyText1,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
