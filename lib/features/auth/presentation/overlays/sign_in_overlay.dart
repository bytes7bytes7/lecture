import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tuple/tuple.dart';

import '../../../../l10n/l10n.dart';
import '../../../../scope/app_scope.dart';
import '../../../common/common.dart';
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

    final state = ref.watch(AppScope.get().authController);

    return CardOverlay(
      title: l10n.signInTitle,
      description: l10n.signInDesc,
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
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: state is! AsyncLoading ? _forgotPassword : null,
                child: Text(
                  l10n.forgotPassword,
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
            onPressed: state is! AsyncLoading ? _openRegister : null,
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
            text: l10n.moveNextBtn,
            onPressed: (value && state is! AsyncLoading) ? _tryToLogIn : null,
          );
        },
      ),
    );
  }

  void _forgotPassword() {
    ref.read(AppScope.get().authController.notifier).openRecover();
  }

  void _openRegister() {
    ref.read(AppScope.get().authController.notifier).openSignUp();
  }

  void _tryToLogIn() {
    ref.read(AppScope.get().authController.notifier).signIn(
          _loginController.text,
          _passController.text,
        );
  }
}
