import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/measures.dart' as const_measures;
import '../../../../l10n/l10n.dart';
import '../../../../scope/app_scope.dart';
import '../../../common/common.dart';
import 'card_overlay.dart';

const _pinMargin = EdgeInsets.symmetric(
  horizontal: const_measures.mainHorMargin,
  vertical: 20.0,
);

class VerifyOverlay extends ConsumerWidget {
  const VerifyOverlay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final state = ref.watch(AppScope.get().authController);

    // To change [validPin] when pin changes
    ref.watch(AppScope.get().pin);
    final validPin = ref.read(AppScope.get().pin.notifier).isValid;

    return CardOverlay(
      title: l10n.verificationCodeTitle,
      description: l10n.verificationCodeDesc,
      body: Expanded(
        child: Container(
          alignment: Alignment.topCenter,
          margin: _pinMargin,
          child: PinTextField(
            onChanged: (value) => _setPin(value, ref),
            enabled: state is! AsyncLoading,
          ),
        ),
      ),
      footer: DoubleButton(
        secondary: l10n.cancelBtn,
        secondaryOnPressed: state is! AsyncLoading ? () => _cancel(ref) : null,
        primary: l10n.moveNextBtn,
        primaryOnPressed:
            (state is! AsyncLoading && validPin) ? () => _next(ref) : null,
      ),
    );
  }

  void _setPin(String value, WidgetRef ref) {
    ref.read(AppScope.get().pin.notifier).newState = value;
  }

  void _cancel(WidgetRef ref) {
    ref.read(AppScope.get().authController.notifier).cancelVerification();
  }

  void _next(WidgetRef ref) {
    ref.read(AppScope.get().loggerManager).log('check PIN');
    final pin = ref.read(AppScope.get().pin);
    ref.read(AppScope.get().authController.notifier).verifyCode(pin);
  }
}
