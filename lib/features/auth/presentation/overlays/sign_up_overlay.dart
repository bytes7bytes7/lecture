import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common.dart';
import '../../../../l10n/l10n.dart';
import '../../../../scope/app_scope.dart';
import '../../../../structs/quintet.dart';
import '../../../../structs/sextet.dart';
import '../../../../widgets/widgets.dart';
import '../../data/auth_repo.dart';
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

    _onData(l10n);

    final state = ref.watch(AppScope.get().signUpController);
    ref.read(AppScope.get().loggerManager).log('new signUp state: $state');

    return CardOverlay(
      title: l10n.signUpTitle,
      description: l10n.signUpDesc,
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
            text: l10n.moveNext,
            onPressed:
                (value && state is! AsyncLoading) ? _tryToRegister : null,
          );
        },
      ),
    );
  }

  void _onData(AppLocalizations l10n) {
    ref.listen<AsyncValue<AuthStatus>>(AppScope.get().signUpController,
        (prev, next) {
      final data = next.asData?.value;
      if (data != null) {
        if (data == AuthStatus.signUp) {
          ref.read(AppScope.get().showConfirmOverlay.notifier).state = true;
        }

        final info = data.toStr(l10n);
        if (info.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(info),
            ),
          );
        }
      }
    });
  }

  void _openSignIn() {
    ref.read(AppScope.get().showSignInOverlay.notifier).state = true;
  }

  void _tryToRegister() {
    ref.read(AppScope.get().signUpController.notifier).signUp(
          _loginController.text,
          _passController.text,
        );
  }
}
