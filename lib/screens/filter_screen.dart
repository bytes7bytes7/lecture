import 'package:flutter/material.dart';

import '../widgets/popup_item_row.dart';
import '../widgets/rounded_button.dart';
import '../widgets/select_item_row.dart';
import '../bloc/lecture_bloc.dart';
import '../global_parameters.dart';

// import '../test_data.dart';
import 'select_screen.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SelectItemRow(
                    hintText: 'Факультет',
                    text: GlobalParameters.facultyNotifier,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SelectScreen(
                              title: 'Выберите факультет',
                              items: GlobalParameters.faculties,
                              notifier: GlobalParameters.facultyNotifier,
                            );
                          },
                        ),
                      );
                    },
                  ),
                  SelectItemRow(
                    hintText: 'Уровень высшего образования',
                    text: GlobalParameters.levelNotifier,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SelectScreen(
                              title: 'Выберите уровень высшего образования',
                              items: GlobalParameters.levels,
                              notifier: GlobalParameters.levelNotifier,
                            );
                          },
                        ),
                      );
                    },
                  ),
                  SelectItemRow(
                    hintText: 'Предмет',
                    text: GlobalParameters.subjectNotifier,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SelectScreen(
                              title: 'Выберите предмет',
                              items: GlobalParameters.subjects,
                              notifier: GlobalParameters.subjectNotifier,
                            );
                          },
                        ),
                      );
                    },
                  ),
                  PopupItemRow(
                    hintText: 'Семестр',
                    text: GlobalParameters.semesterNotifier,
                    itemCount: GlobalParameters.semesters,
                  ),
                ],
              ),
              RoundedButton(
                data: 'Обновить',
                onPressed: () {
                  LectureBloc.updateAllLectures();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
