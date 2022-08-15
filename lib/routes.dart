import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'features/features.dart';
import 'screens/screens.dart';

extension GoRouteStateX on GoRouterState {
  String? get from {
    return queryParams['from'];
  }
}

extension GoRouteX on GoRoute {
  String get title {
    final n = name;
    if (n != null) {
      return n;
    }

    throw Exception('Route has no name!');
  }
}

class AppRoutes {
  AppRoutes._();

  static AppRoutes? _inst;

  static AppRoutes get() {
    final inst = _inst;
    if (inst != null) {
      return inst;
    }

    return _inst = AppRoutes._();
  }

  String fromLoc(String loc) => '?from=$loc';

  final aboutApp = GoRoute(
    path: 'about_app',
    name: 'about_app',
    pageBuilder: (context, state) => CustomTransitionPage(
      key: state.pageKey,
      name: _name(state),
      arguments: _args(state),
      child: const AboutAppScreen(),
      transitionsBuilder: _left,
    ),
  );

  final account = GoRoute(
    path: 'account',
    name: 'account',
    pageBuilder: (context, state) => CustomTransitionPage(
      key: state.pageKey,
      name: _name(state),
      arguments: _args(state),
      child: const AccountScreen(),
      transitionsBuilder: _left,
    ),
  );

  final auth = GoRoute(
    path: '/auth',
    name: 'auth',
    pageBuilder: (context, state) => CustomTransitionPage(
      key: state.pageKey,
      name: _name(state),
      arguments: _args(state),
      child: const AuthScreen(),
      transitionsBuilder: _up,
    ),
  );

  final author = GoRoute(
    path: 'author/:aid',
    name: 'author',
    pageBuilder: (context, state) {
      final id = int.parse(state.params['aid']!);

      return CustomTransitionPage(
        key: state.pageKey,
        name: _name(state),
        arguments: _args(state),
        child: AuthorScreen(
          authorId: id,
        ),
        transitionsBuilder: _left,
      );
    },
  );

  final bookmark = GoRoute(
    path: ':lid',
    name: 'bookmark',
    pageBuilder: (context, state) {
      final id = int.parse(state.params['lid']!);

      return CustomTransitionPage(
        key: state.pageKey,
        name: _name(state),
        arguments: _args(state),
        child: LectureScreen(
          lectureId: id,
        ),
        transitionsBuilder: _left,
      );
    },
  );

  late final bookmarks = GoRoute(
    path: 'bookmarks',
    name: 'bookmarks',
    pageBuilder: (context, state) => CustomTransitionPage(
      key: state.pageKey,
      name: _name(state),
      arguments: _args(state),
      child: const BookmarkScreen(),
      transitionsBuilder: _left,
    ),
    routes: [
      bookmark,
    ],
  );

  final editor = GoRoute(
    path: 'edit',
    name: 'editor',
    pageBuilder: (context, state) => CustomTransitionPage(
      key: state.pageKey,
      name: _name(state),
      arguments: _args(state),
      child: const LectureEditorScreen(),
      transitionsBuilder: _left,
    ),
  );

  late final editorInfo = GoRoute(
    path: 'editor/:lid',
    name: 'editor_info',
    pageBuilder: (context, state) {
      final id = int.parse(state.params['lid']!);

      return CustomTransitionPage(
        key: state.pageKey,
        name: _name(state),
        arguments: _args(state),
        child: LectureMetaScreen(
          lectureId: id,
        ),
        transitionsBuilder: _left,
      );
    },
    routes: [
      editor,
    ],
  );

  late final home = GoRoute(
    path: '/',
    name: 'home',
    pageBuilder: (context, state) => CustomTransitionPage(
      key: state.pageKey,
      name: _name(state),
      arguments: _args(state),
      child: const HomeScreen(),
      transitionsBuilder: _up,
    ),
    routes: [
      lecture,
      editorInfo,
      settings,
      author,
    ],
  );

  final lecture = GoRoute(
    path: 'lectures/:lid',
    name: 'lecture',
    pageBuilder: (context, state) {
      final id = int.parse(state.params['lid']!);

      return CustomTransitionPage(
        key: state.pageKey,
        name: _name(state),
        arguments: _args(state),
        child: LectureScreen(
          lectureId: id,
        ),
        transitionsBuilder: _left,
      );
    },
  );

  final myLecture = GoRoute(
    path: ':lid',
    name: 'my_lecture',
    pageBuilder: (context, state) {
      final id = int.parse(state.params['lid']!);

      return CustomTransitionPage(
        key: state.pageKey,
        name: _name(state),
        arguments: _args(state),
        child: LectureScreen(
          lectureId: id,
        ),
        transitionsBuilder: _left,
      );
    },
  );

  late final myLectures = GoRoute(
    path: 'my_lectures',
    name: 'my_lectures',
    pageBuilder: (context, state) => CustomTransitionPage(
      key: state.pageKey,
      name: _name(state),
      arguments: _args(state),
      child: const MyLecturesScreen(),
      transitionsBuilder: _left,
    ),
    routes: [
      myLecture,
    ],
  );

  final notFound = GoRoute(
    path: '/not_found',
    name: 'not_found',
    pageBuilder: (context, state) => CustomTransitionPage(
      key: state.pageKey,
      name: _name(state),
      arguments: _args(state),
      child: const NotFoundScreen(),
      transitionsBuilder: _up,
    ),
  );

  late final settings = GoRoute(
    path: 'settings',
    name: 'settings',
    pageBuilder: (context, state) => CustomTransitionPage(
      key: state.pageKey,
      name: _name(state),
      arguments: _args(state),
      child: const SettingsScreen(),
      transitionsBuilder: _right,
    ),
    routes: [
      account,
      theme,
      bookmarks,
      myLectures,
      aboutApp,
    ],
  );

  final theme = GoRoute(
    path: 'theme',
    name: 'theme',
    pageBuilder: (context, state) => CustomTransitionPage(
      key: state.pageKey,
      name: _name(state),
      arguments: _args(state),
      child: const ThemeScreen(),
      transitionsBuilder: _left,
    ),
  );

  static String _name(GoRouterState state) => state.name ?? state.subloc;

  static Map<String, Object?> _args(GoRouterState state) => {
        'params': state.params,
        'queryParams': state.queryParams,
        'extra': state.extra,
      };

  static Widget _up(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) =>
      SlideTransition(
        position: animation.drive(
          Tween(
            begin: const Offset(0.0, 1.0),
            end: Offset.zero,
          ).chain(
            CurveTween(curve: Curves.ease),
          ),
        ),
        child: child,
      );

  // ignore: unused_element
  static Widget _down(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) =>
      SlideTransition(
        position: animation.drive(
          Tween(
            begin: const Offset(0.0, -1.0),
            end: Offset.zero,
          ).chain(
            CurveTween(curve: Curves.ease),
          ),
        ),
        child: child,
      );

  static Widget _left(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) =>
      SlideTransition(
        position: animation.drive(
          Tween(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).chain(
            CurveTween(curve: Curves.ease),
          ),
        ),
        child: child,
      );

  static Widget _right(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) =>
      SlideTransition(
        position: animation.drive(
          Tween(
            begin: const Offset(-1.0, 0.0),
            end: Offset.zero,
          ).chain(
            CurveTween(curve: Curves.ease),
          ),
        ),
        child: child,
      );
}
