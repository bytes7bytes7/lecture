part of 'routes.dart';

extension GoRouteX on GoRoute {
  String get title {
    final n = name;
    if (n != null) {
      return n;
    }

    throw Exception('Route has no name!');
  }
}

abstract class CosyRoute {
  GoRoute get route;

  Map<String, String> params() => const {};

  Map<String, String> queryParams() => const {};

  Object? extra() => null;

  static String fromLoc(String loc) => '?from=$loc';

  String namedLocation(BuildContext context) => GoRouter.of(context)
      .namedLocation(route.title, params: params(), queryParams: queryParams());

  void go(BuildContext context) => GoRouter.of(context).goNamed(
        route.title,
        params: params(),
        queryParams: queryParams(),
        extra: extra(),
      );

  void push(BuildContext context) => GoRouter.of(context).pushNamed(
        route.title,
        params: params(),
        queryParams: queryParams(),
        extra: extra(),
      );

  bool canPop(BuildContext context) => GoRouter.of(context).canPop();

  void pop(BuildContext context) => GoRouter.of(context).pop();

  void replace(BuildContext context) => GoRouter.of(context).replaceNamed(
        route.title,
        params: params(),
        queryParams: queryParams(),
        extra: extra(),
      );
}
