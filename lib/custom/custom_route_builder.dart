import 'package:flutter/cupertino.dart';

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

class NextPageRoute extends CupertinoPageRoute {
  NextPageRoute({required this.nextPage})
      : super(builder: (BuildContext context) => nextPage);

  Widget nextPage;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    // final Animation<double> curve =
    //     CurvedAnimation(parent: controller!, curve: Curves.linear);
    // return FadeTransition(opacity: curve, child: nextPage);
    return nextPage;
  }
}
