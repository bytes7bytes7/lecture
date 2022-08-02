import 'package:adaptive_theme/adaptive_theme.dart';
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
  // TODO: after logOut reset all 'show...Overlay' to false and pin to '' (maybe autoDispose can deal with it)
  late final authController =
      StateNotifierProvider<AuthController, AsyncValue<AuthState>>((ref) {
    return AuthController(
      authRepo: ref.watch(authRepo),
    );
  });

  late final authRepo = Provider<AuthRepo>((ref) {
    return AuthRepoImpl(
      client: ref.watch(restClient),
    );
  });

  late final colorTheme =
      StateNotifierProvider<ColorThemeNotifier, AdaptiveThemeMode>((ref) {
    return ColorThemeNotifier(
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

  final navigatorKey =
      Provider<GlobalKey<NavigatorState>>((ref) => GlobalKey<NavigatorState>());

  final restClient = Provider<RestClient>((ref) => throw UnimplementedError());

  final storageRepo = Provider<StorageRepo>(StorageRepoImpl.new);

  final authOverlayConfig =
      StateNotifierProvider<AuthOverlayNotifier, AuthOverlayConfig>((ref) {
    return AuthOverlayNotifier();
  });

  final verifyPin = StateProvider<String>((ref) => '');
}
