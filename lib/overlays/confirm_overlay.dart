import 'dart:math';
import 'package:flutter/material.dart';
import 'package:lecture/overlays/sign_up_overlay.dart';

import '../custom/custom_route_builder.dart';
import '../custom/overlay_viewer.dart';
import '../screens/home_screen.dart';
import '../widgets/double_button.dart';
import '../widgets/pin_entry_text_field.dart';

class ConfirmOverlay extends StatefulWidget {
  const ConfirmOverlay({
    Key? key,
  }) : super(key: key);

  @override
  State<ConfirmOverlay> createState() => _ConfirmOverlayState();
}

class _ConfirmOverlayState extends State<ConfirmOverlay>
    with TickerProviderStateMixin {
  final ValueNotifier<bool> errorNotifier = ValueNotifier(false);
  final ValueNotifier<String> pin = ValueNotifier('');
  late AnimationController _controller;
  late final Animation<Offset> _offsetFloat = Tween(
          begin: const Offset(1, 0.0), end: Offset.zero)
      .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetFloat,
      child: Container(
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
                padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 0.0),
                child: PinEntryTextField(
                  errorNotifier: errorNotifier,
                  cursorColor: Theme.of(context).primaryColor,
                  onSubmit: (value) {
                    pin.value = value;
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: DoubleButton(
                prefix: 'Отмена',
                prefixOnPressed: () {
                  OverlayViewer.openOverlay(
                      context: context, overlay: const SignUpOverlay());
                },
                suffix: 'Далее',
                suffixOnPressed: () {
                  // TODO: verify PIN-code
                  if (pin.value.isNotEmpty) {
                    if (Random().nextInt(2) % 2 == 0) {
                      errorNotifier.value = true;
                    } else {
                      OverlayViewer.dispose();
                      Navigator.of(context).pushReplacement(
                        CustomRouteBuilder(
                          widget: const HomeScreen(),
                        ),
                      );
                    }
                  } else {
                    errorNotifier.value = true;
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
