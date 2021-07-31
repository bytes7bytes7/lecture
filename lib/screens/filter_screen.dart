import 'package:flutter/material.dart';
import 'package:lecture/global_parameters.dart';
import 'package:lecture/screens/select_screen.dart';
import 'package:lecture/test_data.dart';
import 'package:lecture/widgets/rounded_button.dart';

import '../widgets/select_item_row.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const Spacer(
                flex: 1,
              ),
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
                          items: TestData.testJson.keys.toList(),
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
                          items: TestData.testLevels,
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
                          items: TestData.testSubjects,
                          notifier: GlobalParameters.subjectNotifier,
                        );
                      },
                    ),
                  );
                },
              ),
              const Spacer(
                flex: 10,
              ),
              RoundedButton(
                data: 'Обновить',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const Spacer(
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
