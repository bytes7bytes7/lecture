import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tuple/tuple.dart';

import '../../../../l10n/l10n.dart';
import '../../../../scope/app_scope.dart';
import '../../../common/common.dart';
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
                Tuple6<IconData, String, bool, TextInputType,
                    TextEditingController, FormFieldValidator<String>>>[
              Tuple6(
                Icons.mail,
                l10n.email,
                state is! AsyncLoading,
                TextInputType.emailAddress,
                _loginController,
                (_) => emailValidator(
                  value: _loginController.text,
                  l10n: l10n,
                ),
              ),
            ].map(
              (e) {
                return DefaultTextField(
                  icon: e.item1,
                  hint: e.item2,
                  enabled: e.item3,
                  inputType: e.item4,
                  controller: e.item5,
                  validator: e.item6,
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
            primary: l10n.moveNextBtn,
            primaryOnPressed:
                (value && state is! AsyncLoading) ? _tryToRecover : null,
            secondary: l10n.cancelBtn,
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
