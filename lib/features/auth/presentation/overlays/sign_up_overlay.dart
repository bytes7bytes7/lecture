import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tuple/tuple.dart';

import '../../../../l10n/l10n.dart';
import '../../../../scope/app_scope.dart';
import '../../../common/common.dart';
import 'card_overlay.dart';

class SignUpOverlay extends ConsumerStatefulWidget {
  const SignUpOverlay({super.key});

  @override
  ConsumerState<SignUpOverlay> createState() => _SignUpOverlayState();
}

class _SignUpOverlayState extends ConsumerState<SignUpOverlay> {
  late final TextEditingController _loginController;
  late final TextEditingController _passController;
  late final TextEditingController _repPassController;
  late final ValueNotifier<bool> _passObscure;
  late final ValueNotifier<bool> _repPassObscure;
  late final ValueNotifier<bool> _areFieldsValid;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _loginController = TextEditingController()..addListener(_onChanged);
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
    _loginController.dispose();
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

    final state = ref.watch(AppScope.get().authController);

    return CardOverlay(
      title: l10n.signUpTitle,
      description: l10n.signUpDesc,
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
            ...<
                Tuple6<IconData, String, bool, TextEditingController,
                    FormFieldValidator<String>, ValueNotifier<bool>>>[
              Tuple6(
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
              Tuple6(
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
                return SecureTextField(
                  icon: e.item1,
                  hint: e.item2,
                  enabled: e.item3,
                  controller: e.item4,
                  validator: e.item5,
                  obscure: e.item6,
                );
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
            onPressed: state is! AsyncLoading ? _openSignIn : null,
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
            text: l10n.moveNextBtn,
            onPressed:
                (value && state is! AsyncLoading) ? _tryToRegister : null,
          );
        },
      ),
    );
  }

  void _openSignIn() {
    ref.read(AppScope.get().authController.notifier).openSignIn();
  }

  void _tryToRegister() {
    ref.read(AppScope.get().authController.notifier).signUp(
          _loginController.text,
          _passController.text,
        );
  }
}
