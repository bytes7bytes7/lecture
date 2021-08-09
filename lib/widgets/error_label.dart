import 'package:flutter/material.dart';

class ErrorLabel extends StatelessWidget {
  const ErrorLabel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Ошибка :(\nПопробуйте снова позже',
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
              color: Theme.of(context).errorColor,
            ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
