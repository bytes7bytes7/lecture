import 'package:flutter/material.dart';

import '../../../../constants/measures.dart' as const_measures;

const _margin = EdgeInsets.only(bottom: 20.0);
const _primaryFlex = 5;
const _secondaryFlex = 2;

class DoubleButton extends StatelessWidget {
  const DoubleButton({
    super.key,
    required this.primary,
    required this.primaryOnPressed,
    required this.secondary,
    required this.secondaryOnPressed,
  });

  final String primary;
  final VoidCallback? primaryOnPressed;
  final String secondary;
  final VoidCallback? secondaryOnPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Align(
      alignment: Alignment.center,
      child: Container(
        height: const_measures.buttonHeight,
        width: double.infinity,
        margin: _margin,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.only(
              left: const_measures.midPadding,
            ),
            primary: theme.hintColor,
            backgroundColor: theme.disabledColor,
          ),
          onPressed: secondaryOnPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                flex: _secondaryFlex,
                fit: FlexFit.tight,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    secondary,
                    style: theme.textTheme.bodyText2?.copyWith(
                      color: theme.hintColor,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: _primaryFlex,
                fit: FlexFit.tight,
                child: InkWell(
                  overlayColor: MaterialStateProperty.all(
                    Colors.transparent,
                  ),
                  onTap: () {
                    // it MUST be empty callback
                  },
                  child: OutlinedButton(
                    onPressed: primaryOnPressed,
                    child: Text(
                      primary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
