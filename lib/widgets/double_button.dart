import 'package:flutter/material.dart';

class DoubleButton extends StatelessWidget {
  const DoubleButton({
    Key? key,
    required this.prefix,
    required this.prefixOnPressed,
    required this.suffix,
    required this.suffixOnPressed,
  }) : super(key: key);

  final String prefix;
  final VoidCallback prefixOnPressed;
  final String suffix;
  final VoidCallback suffixOnPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 20.0),
      height: 57.0,
      width: double.infinity,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(0),
          primary: Theme.of(context).hintColor,
          backgroundColor: Theme.of(context).disabledColor,
          side: BorderSide(
            color: Theme.of(context).disabledColor,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  prefix,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: Theme.of(context).hintColor),
                ),
              ),
            ),
            Flexible(
              flex: 3,
              fit: FlexFit.tight,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.all(0),
                  primary: Theme.of(context).scaffoldBackgroundColor,
                  backgroundColor: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  side: BorderSide(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                child: Text(
                  suffix,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Theme.of(context).scaffoldBackgroundColor),
                ),
                onPressed: suffixOnPressed,
              ),
            ),
          ],
        ),
        onPressed: prefixOnPressed,
      ),
    );
  }
}
