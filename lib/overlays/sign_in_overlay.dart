import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common.dart';
import '../constants/measures.dart' as const_measures;
import '../l10n/l10n.dart';
import '../scope/app_scope.dart';
import '../structs/quartet.dart';
import '../structs/quintet.dart';
import '../widgets/widgets.dart';

const _padding = EdgeInsets.symmetric(
  horizontal: const_measures.mainHorMargin,
);
const _titleMargin = EdgeInsets.only(
  top: 30.0,
);
const _textMargin = EdgeInsets.symmetric(
  vertical: 10.0,
);
const _bottomTextFlex = 5;

class SignInOverlay extends ConsumerStatefulWidget {
  const SignInOverlay({super.key});

  @override
  ConsumerState<SignInOverlay> createState() => _SignUpOverlayState();
}

class _SignUpOverlayState extends ConsumerState<SignInOverlay> {
  late final TextEditingController _emailController;
  late final TextEditingController _passController;
  late final ValueNotifier<bool> _passObscure;
  late final ValueNotifier<bool> _areFieldsValid;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _emailController = TextEditingController()..addListener(_onChanged);
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
    _emailController.dispose();
    _passController.dispose();
    _passObscure.dispose();
    _areFieldsValid.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    final constraints = ConstraintInherited.of(context).constraints;

    return Container(
      height: constraints.maxHeight,
      width: constraints.maxWidth,
      padding: _padding,
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(const_measures.overlayBorderRadius),
          topRight: Radius.circular(const_measures.overlayBorderRadius),
        ),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: _titleMargin,
              child: Text(
                l10n.signInTitle,
                style: theme.textTheme.headline2,
              ),
            ),
            Container(
              margin: _textMargin,
              child: Text(
                l10n.signInDesc,
                style: theme.textTheme.bodyText1,
              ),
            ),
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
            Expanded(
              flex: _bottomTextFlex,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
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
              ),
            ),
            ValueListenableBuilder<bool>(
              valueListenable: _areFieldsValid,
              builder: (context, value, child) {
                return SingleButton(
                  text: l10n.moveNext,
                  onPressed: value ? _tryToLogIn : null,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _forgotPassword() {}

  void _openRegister() {
    ref.read(AppScope.get().showSignInOverlay.notifier).state = false;
  }

  void _tryToLogIn() {}
}
