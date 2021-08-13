import 'package:flutter/material.dart';

class SingleButton extends StatelessWidget {
  const SingleButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      // TODO: make it smaller (width)
      margin: const EdgeInsets.only(bottom: 20.0),
      height: 57.0,
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
          text,
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: Theme.of(context).scaffoldBackgroundColor),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
