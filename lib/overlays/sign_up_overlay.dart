import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common.dart';
import '../l10n/l10n.dart';
import '../scope/app_scope.dart';
import '../structs/quartet.dart';
import '../structs/quintet.dart';
import '../widgets/widgets.dart';
import 'card_overlay.dart';

class SignUpOverlay extends ConsumerStatefulWidget {
  const SignUpOverlay({super.key});

  @override
  ConsumerState<SignUpOverlay> createState() => _SignUpOverlayState();
}

class _SignUpOverlayState extends ConsumerState<SignUpOverlay> {
  late final TextEditingController _emailController;
  late final TextEditingController _passController;
  late final TextEditingController _repPassController;
  late final ValueNotifier<bool> _passObscure;
  late final ValueNotifier<bool> _repPassObscure;
  late final ValueNotifier<bool> _areFieldsValid;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _emailController = TextEditingController()..addListener(_onChanged);
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
    _emailController.dispose();
    _passController.dispose();
    _repPassController.dispose();
    _passObscure.dispose();
    _repPassObscure.dispose();
    _areFieldsValid.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return CardOverlay(
      title: l10n.signUpTitle,
      description: l10n.signUpDesc,
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
                _emailController,
                (_) => emailValidator(
                  value: _emailController.text,
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
              Quintet(
                Icons.https,
                l10n.repeatPassword,
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
          ],
        ),
      ),
      subFooter: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            l10n.alreadyHaveAccount,
            style: theme.textTheme.bodyText1,
          ),
          TextButton(
            onPressed: _openSignIn,
            child: Text(
              l10n.signIn,
            ),
          ),
        ],
      ),
      footer: ValueListenableBuilder<bool>(
        valueListenable: _areFieldsValid,
        builder: (context, value, child) {
          return SingleButton(
            text: l10n.moveNext,
            onPressed: value ? _tryToRegister : null,
          );
        },
      ),
    );
  }

  void _openSignIn() {
    ref.read(AppScope.get().authState.notifier).state = AuthState.recover;
    ref.read(AppScope.get().showSignInOverlay.notifier).state = true;
  }

  void _tryToRegister() {
    ref.read(AppScope.get().authState.notifier).state = AuthState.signUp;
    ref.read(AppScope.get().showConfirmOverlay.notifier).state = true;
  }
}
