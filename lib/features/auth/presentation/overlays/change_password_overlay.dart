import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../l10n/l10n.dart';
import '../../../../scope/app_scope.dart';
import '../../../common/common.dart';
import 'card_overlay.dart';

class ChangePasswordOverlay extends ConsumerStatefulWidget {
  const ChangePasswordOverlay({super.key});

  @override
  ConsumerState<ChangePasswordOverlay> createState() => _ChangeOverlayState();
}

class _ChangeOverlayState extends ConsumerState<ChangePasswordOverlay> {
  late final TextEditingController _passController;
  late final TextEditingController _repPassController;
  late final ValueNotifier<bool> _passObscure;
  late final ValueNotifier<bool> _repPassObscure;
  late final ValueNotifier<bool> _areFieldsValid;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _passController = TextEditingController()..addListener(_onChanged);
    _repPassController = TextEditingController()..addListener(_onChanged);
    _passObscure = ValueNotifier(true);
    _repPassObscure = ValueNotifier(true);
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
    _passController.dispose();
    _repPassController.dispose();
    _passObscure.dispose();
    _repPassObscure.dispose();
    _areFieldsValid.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final state = ref.watch(AppScope.get().authController);

    return CardOverlay(
      title: l10n.changePasswordTitle,
      description: l10n.changePasswordDesc,
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            ...<
                Sextet<IconData, String, bool, TextEditingController,
                    FormFieldValidator<String>, ValueNotifier<bool>>>[
              Sextet(
                Icons.https,
                l10n.password,
                state is! AsyncLoading,
                _passController,
                (_) => passwdValidator(
                  value: _passController.text,
                  l10n: l10n,
                ),
                _passObscure,
              ),
              Sextet(
                Icons.https,
                l10n.repeatPassword,
                state is! AsyncLoading,
                _repPassController,
                (_) => repeatPasswdValidator(
                  value: _repPassController.text,
                  prevValue: _passController.text,
                  l10n: l10n,
                ),
                _repPassObscure,
              ),
            ].map(
              (e) {
                final notifier = e.sixth;

                if (notifier != null) {
                  return SecureTextField(
                    icon: e.first,
                    hint: e.second,
                    enabled: e.third,
                    controller: e.fourth,
                    validator: e.fifth,
                    obscure: notifier,
                  );
                }

                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
      footer: ValueListenableBuilder<bool>(
        valueListenable: _areFieldsValid,
        builder: (context, value, child) {
          return SingleButton(
            text: l10n.moveNextBtn,
            onPressed:
                (value && state is! AsyncLoading) ? _changePassword : null,
          );
        },
      ),
    );
  }

  void _changePassword() {
    ref
        .read(AppScope.get().authController.notifier)
        .changePassword(_passController.text);
  }
}
