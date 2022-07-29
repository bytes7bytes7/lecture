import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/measures.dart' as const_measures;
import '../l10n/l10n.dart';
import '../scope/app_scope.dart';
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

class ConfirmOverlay extends ConsumerStatefulWidget {
  const ConfirmOverlay({super.key});

  @override
  ConsumerState<ConfirmOverlay> createState() => _ConfirmOverlayState();
}

class _ConfirmOverlayState extends ConsumerState<ConfirmOverlay> {
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
    final l10n = context.l10n;
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
              l10n.verificationCodeTitle,
              style: theme.textTheme.headline2,
            ),
          ),
          Container(
            margin: _textMargin,
            child: Text(
              l10n.verificationCodeDesc,
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
            secondary: l10n.cancel,
            secondaryOnPressed: _cancel,
            primary: l10n.moveNext,
            primaryOnPressed: _next,
          ),
        ],
      ),
    );
  }

  set _pin(String value) {
    ref.read(AppScope.get().confirmPin.notifier).state = value;
  }

  void _cancel() {
    ref.read(AppScope.get().showConfirmOverlay.notifier).state = false;
  }

  void _next() {
    // TODO: verify PIN-code
    final pin = ref.read(AppScope.get().confirmPin);
    if (pin.isNotEmpty && pin.length == 4) {
      ref.read(AppScope.get().showPersonalInfoOverlay.notifier).state = true;
    } else {
      errorNotifier.value = true;
    }
  }
}
