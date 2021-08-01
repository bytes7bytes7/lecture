import 'package:flutter/material.dart' hide DropdownMenuItem;

import '../custom/custom_dropdown_button_form_field.dart';
import '../widgets/rounded_button.dart';
import '../widgets/select_item_row.dart';
import '../global_parameters.dart';
import '../test_data.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: [
                    Flexible(
                      flex: 4,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(20.0),
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
                        child: CustomDropdownButtonFormField(
                          icon: const SizedBox(),
                          style: Theme.of(context).textTheme.bodyText1,
                          decoration: InputDecoration(
                            hintText: 'Семестр',
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    color: Theme.of(context).disabledColor),
                            isCollapsed: true,
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 20),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(
                                color: Theme.of(context).focusColor,
                              ),
                            ),
                          ),
                          onChanged: (value) {
                            if (value.toString() !=
                                GlobalParameters.semesterNotifier.value) {
                              GlobalParameters.semesterNotifier.value = value.toString();
                            }
                          },
                          menuMaxHeight: 150,
                          value: (GlobalParameters
                                  .semesterNotifier.value.isNotEmpty)
                              ? int.parse(GlobalParameters.semesterNotifier.value)
                              : null,
                          items: List.generate(
                            10,
                            (index) {
                              return DropdownMenuItem(
                                child: Text('${index + 1} Семестр'),
                                value: index + 1,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15.0),
                    const Flexible(
                      child: SizedBox(),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              RoundedButton(
                data: 'Обновить',
                onPressed: () {
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
