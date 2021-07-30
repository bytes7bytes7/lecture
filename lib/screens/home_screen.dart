import 'package:flutter/material.dart';

import '../widgets/lecture_card.dart';
import '../test_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              snap: true,
              floating: true,
              expandedHeight: 65,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              flexibleSpace: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Row(
                  children: [
                    Flexible(
                      flex: 3,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        width: double.infinity,
                        height: 42.0,
                        decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(20.0),
                          border:
                              Border.all(color: Theme.of(context).focusColor),
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context)
                                  .focusColor
                                  .withOpacity(0.25),
                              offset: const Offset(0, 3),
                              spreadRadius: 0,
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: TextField(
                          // controller: searchController,
                          style: Theme.of(context).textTheme.bodyText2,
                          scrollPhysics: const BouncingScrollPhysics(),
                          decoration: InputDecoration(
                            hintText: 'Поиск ...',
                            hintStyle: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(color: Theme.of(context).focusColor),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        width: double.infinity,
                        height: 42.0,
                        decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(20.0),
                          border:
                              Border.all(color: Theme.of(context).focusColor),
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context)
                                  .focusColor
                                  .withOpacity(0.25),
                              offset: const Offset(0, 3),
                              spreadRadius: 0,
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.filter_alt_outlined,
                          color: Theme.of(context).focusColor,
                          size: 30.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return LectureCard(lecture: TestData.testLectures[index]);
                },
                childCount: TestData.testLectures.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
