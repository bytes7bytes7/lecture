import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common.dart';
import '../../../../l10n/l10n.dart';
import '../../../../scope/app_scope.dart';
import '../../../../structs/quartet.dart';
import '../../../../structs/quintet.dart';
import '../../../../widgets/widgets.dart';
import 'card_overlay.dart';

class SignInOverlay extends ConsumerStatefulWidget {
  const SignInOverlay({super.key});

  @override
  ConsumerState<SignInOverlay> createState() => _SignInOverlayState();
}

class _SignInOverlayState extends ConsumerState<SignInOverlay> {
  late final TextEditingController _loginController;
  late final TextEditingController _passController;
  late final ValueNotifier<bool> _passObscure;
  late final ValueNotifier<bool> _areFieldsValid;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _loginController = TextEditingController()..addListener(_onChanged);
    _passController = TextEditingController()..addListener(_onChanged);
    _passObscure = ValueNotifier(true);
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
    _passController.dispose();
    _passObscure.dispose();
    _areFieldsValid.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return CardOverlay(
      title: l10n.signInTitle,
      description: l10n.signInDesc,
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
                  controller: e.third,
                  validator: e.fourth,
                );
              },
            ),
            ...<
                Quintet<IconData, String, TextEditingController,
                    FormFieldValidator<String>, ValueNotifier<bool>>>[
              Quintet(
                Icons.https,
                l10n.password,
                _passController,
                (_) => passwdValidator(
                  value: _passController.text,
                  l10n: l10n,
                ),
                _passObscure,
              ),
            ].map(
              (e) {
                final notifier = e.fifth;

                if (notifier != null) {
                  return SecureTextField(
                    icon: e.first,
                    hint: e.second,
                    controller: e.third,
                    validator: e.fourth,
                    obscure: notifier,
                  );
                }

                return const SizedBox.shrink();
              },
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: _forgotPassword,
                child: Text(
                  l10n.forgotPassword,
                  style: theme.textTheme.subtitle1?.copyWith(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      subFooter: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            l10n.doNotHaveAccount,
            style: theme.textTheme.bodyText1,
          ),
          TextButton(
            onPressed: _openRegister,
            child: Text(
              l10n.createAccount,
            ),
          ),
        ],
      ),
      footer: ValueListenableBuilder<bool>(
        valueListenable: _areFieldsValid,
        builder: (context, value, child) {
          return SingleButton(
            text: l10n.moveNext,
            onPressed: value ? _tryToLogIn : null,
          );
        },
      ),
    );
  }

  void _forgotPassword() {
    final authConfig = ref.read(AppScope.get().authOverlayConfig);
    ref.read(AppScope.get().authOverlayConfig.notifier).newState =
        authConfig.copyWith(
      showRecovery: true,
    );
  }

  void _openRegister() {
    final authConfig = ref.read(AppScope.get().authOverlayConfig);
    ref.read(AppScope.get().authOverlayConfig.notifier).newState =
        authConfig.copyWith(
      showSignIn: false,
    );
  }

  void _tryToLogIn() {
    ref.read(AppScope.get().loggerManager).log('log in');
  }
}
