import 'package:flutter/material.dart';

import '../constants/measures.dart' as const_measures;
import '../global_parameters.dart';
import '../widgets/widgets.dart';

const _padding = EdgeInsets.symmetric(
  horizontal: const_measures.mainHorMargin,
);
const _titleMargin = EdgeInsets.only(
  top: 30.0,
);
const _textMargin = EdgeInsets.symmetric(
  vertical: 10.0,
);
const _pinMargin = EdgeInsets.symmetric(
  horizontal: const_measures.mainHorMargin,
  vertical: 20.0,
);

class ConfirmOverlay extends StatefulWidget {
  const ConfirmOverlay({Key? key}) : super(key: key);

  @override
  State<ConfirmOverlay> createState() => _ConfirmOverlayState();
}

class _ConfirmOverlayState extends State<ConfirmOverlay> {
  late final ValueNotifier<bool> errorNotifier;

  @override
  void initState() {
    super.initState();

    errorNotifier = ValueNotifier(false);
  }

  @override
  void dispose() {
    errorNotifier.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final constraints = ConstraintInherited.of(context).constraints;

    return Container(
      height: constraints.maxHeight,
      width: constraints.maxWidth,
      padding: _padding,
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(const_measures.overlayBorderRadius),
          topRight: Radius.circular(const_measures.overlayBorderRadius),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: _titleMargin,
            child: Text(
              'Код подтверждения',
              style: theme.textTheme.headline2,
            ),
          ),
          Container(
            margin: _textMargin,
            child: Text(
              'Введите код, который был выслан на электронную почту',
              style: theme.textTheme.bodyText1,
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.topCenter,
              margin: _pinMargin,
              child: PinEntryTextField(
                errorNotifier: errorNotifier,
                onSubmit: (value) => _pin = value,
              ),
            ),
          ),
          DoubleButton(
            secondary: 'Отмена',
            secondaryOnPressed: _cancel,
            primary: 'Далее',
            primaryOnPressed: _next,
          ),
        ],
      ),
    );
  }

  set _pin(String value) => GlobalParameters.pin = value;

  void _cancel() {
    GlobalParameters.confirmOverlayNotifier.value = false;
  }

  void _next() {
    // TODO: verify PIN-code
    if (GlobalParameters.pin.isNotEmpty && GlobalParameters.pin.length == 4) {
      GlobalParameters.personalInfoOverlayNotifier.value = true;
    } else {
      errorNotifier.value = true;
    }
  }
}
