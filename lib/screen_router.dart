// ignore_for_file: unused_element

import 'package:flutter/cupertino.dart';
import 'package:rest_client/constants.dart' as const_api;
import 'package:rest_client/rest_client.dart';

import 'constants/routes.dart' as const_routes;
import 'screens/screens.dart';

part 'custom_route_builder.dart';

class ScreenRouter {
  ScreenRouter._();

  static final inst = ScreenRouter._();

  Route navigate(RouteSettings settings) {
    final name = settings.name ?? '';
    final args = <String, Object?>{};
    final rawArgs = settings.arguments;
    if (rawArgs is Map<String, Object?>) {
      args.addAll(rawArgs);
    }

    switch (name) {
      case const_routes.auth:
        return _up(const AuthenticationScreen());
      case const_routes.author:
        final author = args[const_api.author];
        if (author is User) {
          return _left(
            AuthorScreen(
              author: author,
            ),
          );
        }

        return navigate(const RouteSettings(name: ''));
      case const_routes.bookmark:
        return _left(const BookmarkScreen());
      case const_routes.home:
        return _up(const HomeScreen());
      case const_routes.editor:
        return _left(const LectureEditorScreen());
      case const_routes.lecture:
        final lecture = args[const_api.lecture];
        if (lecture is Lecture) {
          return _left(
            LectureScreen(
              lecture: lecture,
            ),
          );
        }

        return navigate(const RouteSettings(name: ''));
      case const_routes.myLectures:
        return _left(const MyLecturesScreen());
      case const_routes.settings:
        return _right(const SettingsScreen());
      case const_routes.theme:
        return _left(const ThemeScreen());
      default:
        return _up(const NotFoundScreen());
    }
  }

  Route _up(Widget page) => CustomRouteBuilder(
        page,
        begin: const Offset(0.0, 1.0),
        end: Offset.zero,
      );

  Route _down(Widget page) => CustomRouteBuilder(
        page,
        begin: const Offset(0.0, -1.0),
        end: Offset.zero,
      );

  Route _left(Widget page) => CustomRouteBuilder(
        page,
        begin: const Offset(1.0, 0.0),
        end: Offset.zero,
      );

  Route _right(Widget page) => CustomRouteBuilder(
        page,
        begin: const Offset(-1.0, 0.0),
        end: Offset.zero,
      );
}
