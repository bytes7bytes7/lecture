import 'package:flutter/material.dart';
import 'package:quick_quotes_quill/all.dart';

extension on Route<dynamic> {
  String get str => 'route(name: ${settings.name}, args: ${settings.arguments})';
}

class NavObserver extends NavigatorObserver {
  NavObserver(this._manager);

  final SpreadQuillManager _manager;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _log('didPush', route, previousRoute);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _log('didPop', route, previousRoute);
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _log('didRemove', route, previousRoute);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    _log('didReplace', newRoute, oldRoute);
  }

  @override
  void didStartUserGesture(
    Route<dynamic> route,
    Route<dynamic>? previousRoute,
  ) {
    _log('didStartUserGesture', route, previousRoute);
  }

  @override
  void didStopUserGesture() {
    _log('didStopUserGesture', null, null);
  }

  void _log(
    String methodName,
    Route<dynamic>? route,
    Route<dynamic>? prevRoute,
  ) {
    _manager.info(
      '$methodName { route: ${route?.str}, prevRoute: ${prevRoute?.str}}',
    );
  }
}
