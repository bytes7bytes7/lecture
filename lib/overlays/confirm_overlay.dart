import 'dart:math';
import 'package:flutter/material.dart';

import '../widgets/double_button.dart';
import '../global_parameters.dart';

class ConfirmOverlay extends StatelessWidget {
  ConfirmOverlay({
    Key? key,
    required this.constraints,
  }) : super(key: key);

  final BoxConstraints constraints;

  final ValueNotifier<bool> errorNotifier = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    String pin = '';
    return Container(
      height: constraints.maxHeight,
      width: constraints.maxWidth,
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
          // Expanded(
          //   child: Container(
          //     alignment: Alignment.topCenter,
          //     padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 0.0),
          //     child: PinEntryTextField(
          //       errorNotifier: errorNotifier,
          //       cursorColor: Theme.of(context).primaryColor,
          //       onSubmit: (value) {
          //         pin = value;
          //         print(pin);
          //       },
          //     ),
          //   ),
          // ),
          Align(
            alignment: Alignment.center,
            child: DoubleButton(
              prefix: 'Отмена',
              prefixOnPressed: () {
                GlobalParameters.confirmOverlayNotifier.value = false;
              },
              suffix: 'Далее',
              suffixOnPressed: () {
                // TODO: verify PIN-code
                if (pin.isNotEmpty) {
                  if (Random().nextInt(2) % 2 == 0) {
                    errorNotifier.value = true;
                  } else {
                    GlobalParameters.personalInfoOverlayNotifier.value = true;
                  }
                } else {
                  errorNotifier.value = true;
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
