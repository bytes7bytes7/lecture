import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/measures.dart' as const_measures;
import '../l10n/l10n.dart';
import '../scope/app_scope.dart';
import '../widgets/widgets.dart';
import 'card_overlay.dart';

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
    final l10n = context.l10n;

    return CardOverlay(
      title: l10n.verificationCodeTitle,
      description: l10n.verificationCodeDesc,
      body: Expanded(
        child: Container(
          alignment: Alignment.topCenter,
          margin: _pinMargin,
          child: PinEntryTextField(
            errorNotifier: errorNotifier,
            onSubmit: (value) => _pin = value,
          ),
        ),
      ),
      footer: DoubleButton(
        secondary: l10n.cancel,
        secondaryOnPressed: _cancel,
        primary: l10n.moveNext,
        primaryOnPressed: _next,
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
    ref.read(AppScope.get().loggerManager).log('check PIN');
    final pin = ref.read(AppScope.get().confirmPin);
    if (pin.isNotEmpty && pin.length == 4) {
      final provider = ref.read(AppScope.get().showAfterConfirmOverlay).state;
      ref.read(provider).state = true;
    } else {
      errorNotifier.value = true;
    }
  }
}
