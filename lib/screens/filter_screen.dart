import 'package:flutter/material.dart';
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
            children:[
              const Spacer(
                flex: 1,
              ),
              const SelectItemRow(
                text: 'Физико-технический',
              ),
              const SelectItemRow(
                text: 'Бакалавриат, 1 Курс',
              ),
              const SelectItemRow(
                text: 'Математический анализ',
              ),
              const Spacer(
                flex: 10,
              ),
              RoundedButton(
                data: 'Готово',
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
