import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomRouteBuilder extends PageRouteBuilder {
  final Widget widget;
  final Offset begin;
  final Offset end;
  final Curve curve;

  CustomRouteBuilder({
    required this.widget,
    this.begin = const Offset(1.0, 0.0),
    this.end = const Offset(0.0, 0.0),
    this.curve = Curves.ease,
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => widget,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
}