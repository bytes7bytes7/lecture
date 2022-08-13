import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_db/local_db.dart';
import 'package:quick_quotes_quill/all.dart';
import 'package:rest_client/rest_client.dart';

import '../constants/app.dart' as const_app;
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

  late final daoFactory =
      Provider<DaoFactory>((ref) => DaoFactory(ref.watch(localDB)));

  late final editorController =
      StateNotifierProvider<EditorController, AsyncValue<void>>((ref) {
    return EditorController(editorRepo: ref.watch(editorRepo));
  });

  late final editorRepo = Provider<EditorRepo>(
    (ref) {
      final factory = ref.watch(daoFactory);
      return EditorRepoImpl(
        factory.draftLecture(),
        factory.draftContent(),
      );
    },
  );

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

  final localDB = Provider<LocalDB>((ref) => LocalDB(const_app.localDBName));

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
