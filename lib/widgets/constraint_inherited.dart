import 'package:flutter/material.dart';

class ConstraintInherited extends InheritedWidget {
  const ConstraintInherited({
    Key? key,
    required this.constraints,
    required Widget child,
  }) : super(key: key, child: child);

  final BoxConstraints constraints;

  static ConstraintInherited of(BuildContext context) {
    final result =
        context.dependOnInheritedWidgetOfExactType<ConstraintInherited>();
    assert(result != null, 'No ConstraintInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(ConstraintInherited oldWidget) =>
      constraints != oldWidget.constraints;
}
