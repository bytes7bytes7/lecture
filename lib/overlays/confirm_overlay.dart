import 'package:flutter/material.dart';

import '../widgets/pin_entry_text_field.dart';
import '../widgets/single_button.dart';

class ConfirmOverlay extends StatelessWidget {
  ConfirmOverlay({
    Key? key,
  }) : super(key: key);

  final ValueNotifier<bool> errorNotifier = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return  Container(
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
              'Код подтверждения',
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Введите код, который был выслан на электронную почту',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const SizedBox(height: 20),
          //ConfirmCodeRow(codeNotifier: ValueNotifier<String>('')),
          Expanded(
            child: Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.fromLTRB(
                  25.0, 10.0, 25.0, 0.0),
              child: PinEntryTextField(
                errorNotifier: errorNotifier,
                cursorColor: Theme.of(context).primaryColor,
                onSubmit: (value) {
                  // TODO: fix validator
                  print(value);
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SingleButton(
              text: 'Далее',
              onPressed: () {
                errorNotifier.value = !errorNotifier.value;
              },
            ),
          ),
        ],
      ),
    );
  }
}
