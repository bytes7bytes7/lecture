import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_quotes_quill/all.dart';
import 'package:rest_client/rest_client.dart';

import '../features/features.dart';
import '../models/models.dart';
import '../repositories/impl/impls.dart';
import '../repositories/interface/interfaces.dart';
import 'src/export.dart';

mixin AppProviders {
  // TODO: after logOut reset all 'show...Overlay' to false and pin to ''
  late final authController =
      StateNotifierProvider<AuthController, AsyncValue<AuthStatus>>((ref) {
    return AuthController(
      authRepo: ref.watch(authRepo),
    );
  });

  late final authRepo = Provider<AuthRepo>((ref) {
    return AuthRepoImpl(
      ref: ref,
      client: ref.watch(restClient),
      user: user,
    );
  });

  late final colorTheme =
      StateNotifierProvider<ColorThemeNotifier, ColorTheme>((ref) {
    return ColorThemeNotifier(
      ColorTheme.system,
      ref: ref,
      navigatorKey: navigatorKey,
    );
  });

  final filter = StateNotifierProvider<FilterNotifier, FilterConfig>((ref) {
    return FilterNotifier(
      FilterConfig.empty,
    );
  });

  final filterRepo = Provider<FilterRepo>(FilterRepoImpl.new);

  late final isFilterUpdated = StateProvider<bool>((ref) {
    // TODO: think up something clever
    ref.watch(filter);
    return ref.read(filter.notifier).hasStateChanged;
  });

  final lectureRepo = Provider<LectureRepo>(LectureRepoImpl.new);

  final loggerManager =
      Provider<SpreadQuillManager>((ref) => throw UnimplementedError());

  final navigatorKey = Provider((ref) => GlobalKey<NavigatorState>());

  final restClient =
      Provider<RestClient>((ref) => ClientFactory().createMockClient());

  final storageRepo = Provider<StorageRepo>(StorageRepoImpl.new);

  final showChangePasswdOverlay = StateProvider<bool>((ref) => false);

  final showPersonalInfoOverlay = StateProvider<bool>((ref) => false);

  final showRecoveryOverlay = StateProvider<bool>((ref) => false);

  final showSignInOverlay = StateProvider<bool>((ref) => false);

  final showVerifyOverlay = StateProvider<bool>((ref) => false);

  final verifyPin = StateProvider<String>((ref) => '');

  late final user = StateNotifierProvider<UserNotifier, User>((ref) {
    return UserNotifier(
      notAuthorizedUser,
    );
  });
}
