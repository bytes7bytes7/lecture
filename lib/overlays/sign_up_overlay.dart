import 'package:flutter/material.dart';

import '../constants/measures.dart' as const_measures;
import '../global_parameters.dart';
import '../l10n/l10n.dart';
import '../utils/triple.dart';
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

class SignUpOverlay extends StatefulWidget {
  const SignUpOverlay({super.key});

  @override
  State<SignUpOverlay> createState() => _SignUpOverlayState();
}

class _SignUpOverlayState extends State<SignUpOverlay> {
  late final ValueNotifier<bool> passObscure;
  late final ValueNotifier<bool> repPassObscure;

  @override
  void initState() {
    super.initState();

    passObscure = ValueNotifier<bool>(true);
    repPassObscure = ValueNotifier<bool>(true);
  }

  @override
  void dispose() {
    passObscure.dispose();
    repPassObscure.dispose();

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: _titleMargin,
            child: Text(
              l10n.signUpTitle,
              style: theme.textTheme.headline2,
            ),
          ),
          Container(
            margin: _textMargin,
            child: Text(
              l10n.signUpDesc,
              style: theme.textTheme.bodyText1,
            ),
          ),
          ...<MapEntry<String, IconData>>[
            MapEntry(l10n.email, Icons.mail),
          ].map(
            (pair) {
              return SimpleTextField(
                icon: pair.value,
                hint: pair.key,
              );
            },
          ),
          ...<Triple<String, IconData, ValueNotifier<bool>>>[
            Triple(
              first: l10n.password,
              second: Icons.https,
              third: passObscure,
            ),
            Triple(
              first: l10n.repeatPassword,
              second: Icons.https,
              third: repPassObscure,
            ),
          ].map(
            (triple) {
              final first = triple.first;
              final second = triple.second;
              final third = triple.third;

              if (first != null && second != null && third != null) {
                return SecureTextField(
                  icon: second,
                  hint: first,
                  obscure: third,
                );
              }

              return const SizedBox.shrink();
            },
          ),
          Expanded(
            flex: _bottomTextFlex,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    l10n.alreadyHaveAccount,
                    style: theme.textTheme.bodyText1,
                  ),
                  TextButton(
                    onPressed: _signIn,
                    child: Text(
                      l10n.signIn,
                      style: theme.textTheme.subtitle2?.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SingleButton(
            text: l10n.moveNext,
            onPressed: _next,
          ),
        ],
      ),
    );
  }

  void _signIn() {
    GlobalParameters.confirmOverlayNotifier.value = true;
  }

  void _next() {
    GlobalParameters.confirmOverlayNotifier.value = true;
  }
}
