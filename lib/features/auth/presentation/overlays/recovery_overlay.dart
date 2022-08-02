import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common.dart';
import '../../../../l10n/l10n.dart';
import '../../../../scope/app_scope.dart';
import '../../../../structs/quintet.dart';
import '../../../../widgets/widgets.dart';
import 'card_overlay.dart';

class RecoveryOverlay extends ConsumerStatefulWidget {
  const RecoveryOverlay({super.key});

  @override
  ConsumerState<RecoveryOverlay> createState() => _RecoveryOverlayState();
}

class _RecoveryOverlayState extends ConsumerState<RecoveryOverlay> {
  late final TextEditingController _loginController;
  late final ValueNotifier<bool> _areFieldsValid;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _loginController = TextEditingController()..addListener(_onChanged);
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
    _loginController.dispose();
    _areFieldsValid.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final state = ref.watch(AppScope.get().authController);

    return CardOverlay(
      title: l10n.recoveryTitle,
      description: l10n.recoveryDesc,
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            ...<
                Quintet<IconData, String, bool, TextEditingController,
                    FormFieldValidator<String>>>[
              Quintet(
                Icons.mail,
                l10n.email,
                state is! AsyncLoading,
                _loginController,
                (_) => emailValidator(
                  value: _loginController.text,
                  l10n: l10n,
                ),
              ),
            ].map(
              (e) {
                return SimpleTextField(
                  icon: e.first,
                  hint: e.second,
                  enabled: e.third,
                  controller: e.fourth,
                  validator: e.fifth,
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
            primaryOnPressed:
                (value && state is! AsyncLoading) ? _tryToRecover : null,
            secondary: l10n.cancel,
            secondaryOnPressed: state is! AsyncLoading ? _backToSignIn : null,
          );
        },
      ),
    );
  }

  void _tryToRecover() {
    ref
        .read(AppScope.get().authController.notifier)
        .recover(_loginController.text);
  }

  void _backToSignIn() {
    ref.read(AppScope.get().authController.notifier).cancelRecovery();
  }
}
