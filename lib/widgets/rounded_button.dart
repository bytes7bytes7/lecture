import 'package:flutter/material.dart';

import '../constants.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.data,
    required this.onPressed,
  }) : super(key: key);

  final dynamic data;
  final VoidFunction onPressed;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          border: Border.all(
            color: Theme.of(context).focusColor,
          ),
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).focusColor.withOpacity(0.25),
              offset: const Offset(0, 3),
              spreadRadius: 0,
              blurRadius: 4,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Material(
            child: InkWell(
              onTap: onPressed,
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: (data is IconData)
                    ? Icon(
                        data,
                        color: Theme.of(context).focusColor,
                        size: 25.0,
                      )
                    : (data is String)
                        ? Text(
                            data,
                            style: Theme.of(context).textTheme.bodyText1,
                          )
                        : const SizedBox.shrink(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
