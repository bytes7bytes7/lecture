part of 'routes.dart';

String _name(GoRouterState state) => state.name ?? state.subloc;

Map<String, Object?> _args(GoRouterState state) => {
      'params': state.params,
      'queryParams': state.queryParams,
      'extra': state.extra,
    };

// ignore: avoid_classes_with_only_static_members
/// All routes MUST have a name!
class _AppRoutes {
  static final aboutApp = GoRoute(
    path: 'about_app',
    name: 'about_app',
    pageBuilder: (context, state) => CustomTransitionPage(
      key: state.pageKey,
      name: _name(state),
      arguments: _args(state),
      child: const AboutAppScreen(),
      transitionsBuilder: _RouteTransitions.left,
    ),
  );

  static final account = GoRoute(
    path: 'account',
    name: 'account',
    pageBuilder: (context, state) => CustomTransitionPage(
      key: state.pageKey,
      name: _name(state),
      arguments: _args(state),
      child: const AccountScreen(),
      transitionsBuilder: _RouteTransitions.left,
    ),
  );

  static final auth = GoRoute(
    path: '/auth',
    name: 'auth',
    pageBuilder: (context, state) => CustomTransitionPage(
      key: state.pageKey,
      name: _name(state),
      arguments: _args(state),
      child: const AuthScreen(),
      transitionsBuilder: _RouteTransitions.up,
    ),
  );

  static final author = GoRoute(
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
        transitionsBuilder: _RouteTransitions.left,
      );
    },
  );

  static final bookmarks = GoRoute(
    path: 'bookmarks',
    name: 'bookmarks',
    pageBuilder: (context, state) => CustomTransitionPage(
      key: state.pageKey,
      name: _name(state),
      arguments: _args(state),
      child: const BookmarkScreen(),
      transitionsBuilder: _RouteTransitions.left,
    ),
  );

  static final editor = GoRoute(
    path: 'edit',
    name: 'editor',
    pageBuilder: (context, state) => CustomTransitionPage(
      key: state.pageKey,
      name: _name(state),
      arguments: _args(state),
      child: const LectureEditorScreen(),
      transitionsBuilder: _RouteTransitions.left,
    ),
  );

  static final editorInfo = GoRoute(
    path: 'editor/:lid',
    name: 'editor_info',
    pageBuilder: (context, state) {
      final id = state.params['lid'];

      return CustomTransitionPage(
        key: state.pageKey,
        name: _name(state),
        arguments: _args(state),
        child: LectureMetaScreen(
          lectureId: id != null ? int.parse(id) : null,
        ),
        transitionsBuilder: _RouteTransitions.left,
      );
    },
    routes: [
      editor,
    ],
  );

  static final home = GoRoute(
    path: '/',
    name: 'home',
    pageBuilder: (context, state) => CustomTransitionPage(
      key: state.pageKey,
      name: _name(state),
      arguments: _args(state),
      child: const HomeScreen(),
      transitionsBuilder: _RouteTransitions.up,
    ),
    routes: [
      author,
      editorInfo,
      lecture,
      settings,
    ],
  );

  static final lecture = GoRoute(
    path: 'lecture/:lid',
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
        transitionsBuilder: _RouteTransitions.left,
      );
    },
  );

  static final myLectures = GoRoute(
    path: 'my_lectures',
    name: 'my_lectures',
    pageBuilder: (context, state) => CustomTransitionPage(
      key: state.pageKey,
      name: _name(state),
      arguments: _args(state),
      child: const MyLecturesScreen(),
      transitionsBuilder: _RouteTransitions.left,
    ),
  );

  static final notFound = GoRoute(
    path: '/not_found',
    name: 'not_found',
    pageBuilder: (context, state) => CustomTransitionPage(
      key: state.pageKey,
      name: _name(state),
      arguments: _args(state),
      child: const NotFoundScreen(),
      transitionsBuilder: _RouteTransitions.up,
    ),
  );

  static final settings = GoRoute(
    path: 'settings',
    name: 'settings',
    pageBuilder: (context, state) => CustomTransitionPage(
      key: state.pageKey,
      name: _name(state),
      arguments: _args(state),
      child: const SettingsScreen(),
      transitionsBuilder: _RouteTransitions.right,
    ),
    routes: [
      account,
      theme,
      bookmarks,
      myLectures,
      aboutApp,
    ],
  );

  static final theme = GoRoute(
    path: 'theme',
    name: 'theme',
    pageBuilder: (context, state) => CustomTransitionPage(
      key: state.pageKey,
      name: _name(state),
      arguments: _args(state),
      child: const ThemeScreen(),
      transitionsBuilder: _RouteTransitions.left,
    ),
  );
}
