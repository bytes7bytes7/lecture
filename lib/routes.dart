import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'features/features.dart';
import 'screens/screens.dart';

part 'app_routes.dart';

part 'cosy_route.dart';

part 'route_transitions.dart';

extension GoRouteStateX on GoRouterState {
  String? get from {
    return queryParams['from'];
  }
}

class AboutAppRoute extends CosyRoute {
  @override
  final route = _AppRoutes.aboutApp;
}

class AccountRoute extends CosyRoute {
  @override
  final route = _AppRoutes.account;
}

class AuthRoute extends CosyRoute {
  @override
  final route = _AppRoutes.auth;
}

class AuthorRoute extends CosyRoute {
  AuthorRoute({required this.aid});

  @override
  final route = _AppRoutes.author;

  final int aid;

  @override
  Map<String, String> params() => {
        'aid': '$aid',
      };
}

class BookmarksRoute extends CosyRoute {
  @override
  final route = _AppRoutes.bookmarks;
}

class EditorRoute extends CosyRoute {
  EditorRoute({this.lid});

  @override
  final route = _AppRoutes.editor;

  final int? lid;

  @override
  Map<String, String> params() => {
    'lid': '$lid',
  };
}

class EditorInfoRoute extends CosyRoute {
  EditorInfoRoute({this.lid});

  final int? lid;

  @override
  final route = _AppRoutes.editorInfo;

  @override
  Map<String, String> params() => {
        'lid': '$lid',
      };
}

class HomeRoute extends CosyRoute {
  @override
  final route = _AppRoutes.home;
}

class LectureRoute extends CosyRoute {
  LectureRoute({required this.lid});

  final int lid;

  @override
  final route = _AppRoutes.lecture;

  @override
  Map<String, String> params() => {
        'lid': '$lid',
      };
}

class MyLecturesRoute extends CosyRoute {
  @override
  final route = _AppRoutes.myLectures;
}

class NotFoundRoute extends CosyRoute {
  @override
  final route = _AppRoutes.notFound;
}

class SettingsRoute extends CosyRoute {
  @override
  final route = _AppRoutes.settings;
}

class ThemeRoute extends CosyRoute {
  @override
  final route = _AppRoutes.theme;
}
