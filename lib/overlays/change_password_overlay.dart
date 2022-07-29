import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common.dart';
import '../constants/measures.dart' as const_measures;
import '../l10n/l10n.dart';
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
                l10n.changePasswordTitle,
                style: theme.textTheme.headline2,
              ),
            ),
            Container(
              margin: _textMargin,
              child: Text(
                l10n.changePasswordDesc,
                style: theme.textTheme.bodyText1,
              ),
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
            const Expanded(
              flex: _bottomTextFlex,
              child: SizedBox.shrink(),
            ),
            ValueListenableBuilder<bool>(
              valueListenable: _areFieldsValid,
              builder: (context, value, child) {
                return SingleButton(
                  text: l10n.moveNext,
                  onPressed: value ? _changePasswd : null,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _changePasswd() {

  }
}
