import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/measures.dart' as const_measures;
import '../../../../l10n/l10n.dart';
import '../../../../scope/app_scope.dart';
import '../../../../widgets/widgets.dart';
import '../../data/auth_repo.dart';
import 'card_overlay.dart';

const _pinMargin = EdgeInsets.symmetric(
  horizontal: const_measures.mainHorMargin,
  vertical: 20.0,
);

class VerifyOverlay extends ConsumerStatefulWidget {
  const VerifyOverlay({super.key});

  @override
  ConsumerState<VerifyOverlay> createState() => _VerifyOverlayState();
}

class _VerifyOverlayState extends ConsumerState<VerifyOverlay> {
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

    _onData();

    final state = ref.watch(AppScope.get().authController);

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
            enabled: state is! AsyncLoading,
          ),
        ),
      ),
      footer: DoubleButton(
        secondary: l10n.cancel,
        secondaryOnPressed: state is! AsyncLoading ? _cancel : null,
        primary: l10n.moveNext,
        primaryOnPressed: state is! AsyncLoading ? _next : null,
      ),
    );
  }

  void _onData() {
    ref.listen<AsyncValue<AuthStatus>>(AppScope.get().authController,
        (prev, next) {
      final data = next.asData?.value;
      if (data == AuthStatus.wrongCode) {
        errorNotifier.value = true;
      }
    });
  }

  set _pin(String value) {
    ref.read(AppScope.get().verifyPin.notifier).state = value;
  }

  void _cancel() {
    ref.read(AppScope.get().showVerifyOverlay.notifier).state = false;
  }

  void _next() {
    ref.read(AppScope.get().loggerManager).log('check PIN');
    final pin = ref.read(AppScope.get().verifyPin);
    ref.read(AppScope.get().authController.notifier).verifyCode(pin);
  }
}
