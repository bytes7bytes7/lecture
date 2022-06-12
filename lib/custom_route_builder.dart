part of 'screen_router.dart';

class CustomRouteBuilder extends PageRouteBuilder {
  final Widget page;
  final Offset begin;
  final Offset end;
  final Curve curve;

  CustomRouteBuilder(
    this.page, {
    required this.begin,
    required this.end,
    this.curve = Curves.ease,
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final tween = Tween(
              begin: begin,
              end: end,
            ).chain(
              CurveTween(
                curve: curve,
              ),
            );

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
}
