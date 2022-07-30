import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common.dart';
import '../../../../l10n/l10n.dart';
import '../../../../scope/app_scope.dart';
import '../../../../structs/quartet.dart';
import '../../../../widgets/widgets.dart';
import 'card_overlay.dart';

class RecoveryOverlay extends ConsumerStatefulWidget {
  const RecoveryOverlay({super.key});

  @override
  ConsumerState<RecoveryOverlay> createState() => _RecoveryOverlayState();
}

class _RecoveryOverlayState extends ConsumerState<RecoveryOverlay> {
  late final TextEditingController _loginlController;
  late final ValueNotifier<bool> _areFieldsValid;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _loginlController = TextEditingController()..addListener(_onChanged);
    _areFieldsValid = ValueNotifier(false);
  }

  void _onChanged() {
    if (_formKey.currentState?.validate() == true) {
      if (!_areFieldsValid.value) {
        _areFieldsValid.value = true;
      }
    } else {
      if (_areFieldsValid.value) {
        _areFieldsValid.value = false;
      }
    }
  }

  @override
  void dispose() {
    _loginlController.dispose();
    _areFieldsValid.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return CardOverlay(
      title: l10n.recoveryTitle,
      description: l10n.recoveryDesc,
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            ...<
                Quartet<IconData, String, TextEditingController,
                    FormFieldValidator<String>>>[
              Quartet(
                Icons.mail,
                l10n.email,
                _loginlController,
                (_) => emailValidator(
                  value: _loginlController.text,
                  l10n: l10n,
                ),
              ),
            ].map(
              (e) {
                return SimpleTextField(
                  icon: e.first,
                  hint: e.second,
                  controller: e.third,
                  validator: e.fourth,
                );
              },
            ),
          ],
        ),
      ),
      footer: ValueListenableBuilder<bool>(
        valueListenable: _areFieldsValid,
        builder: (context, value, child) {
          return DoubleButton(
            primary: l10n.moveNext,
            primaryOnPressed: value ? _tryToRecover : null,
            secondary: l10n.cancel,
            secondaryOnPressed: _backToSignIn,
          );
        },
      ),
    );
  }

  void _tryToRecover() {
    ref.read(AppScope.get().loggerManager).log('try to recover');
    ref.read(AppScope.get().showVerifyOverlay.notifier).state = true;
  }

  void _backToSignIn() {
    _loginlController.clear();
    ref.read(AppScope.get().showRecoveryOverlay.notifier).state = false;
  }
}
