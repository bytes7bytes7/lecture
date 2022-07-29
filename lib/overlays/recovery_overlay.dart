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

class RecoveryOverlay extends ConsumerStatefulWidget {
  const RecoveryOverlay({super.key});

  @override
  ConsumerState<RecoveryOverlay> createState() => _SignUpOverlayState();
}

class _SignUpOverlayState extends ConsumerState<RecoveryOverlay> {
  late final TextEditingController _emailController;
  late final ValueNotifier<bool> _areFieldsValid;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _emailController = TextEditingController()..addListener(_onChanged);
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
                l10n.recoveryTitle,
                style: theme.textTheme.headline2,
              ),
            ),
            Container(
              margin: _textMargin,
              child: Text(
                l10n.recoveryDesc,
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
            const Expanded(
              flex: _bottomTextFlex,
              child: SizedBox.shrink(),
            ),
            ValueListenableBuilder<bool>(
              valueListenable: _areFieldsValid,
              builder: (context, value, child) {
                return DoubleButton(
                  primary: l10n.moveNext,
                  primaryOnPressed: value ? _tryToRecover : null,
                  secondary: l10n.cancel,
                  secondaryOnPressed: _backToSignIn,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _tryToRecover() {}

  void _backToSignIn() {
    _emailController.clear();
    ref.read(AppScope.get().showRecoveryOverlay.notifier).state = false;
  }
}
