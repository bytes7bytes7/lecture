import 'package:flutter/material.dart';
import 'package:quick_quotes_quill/all.dart';
import 'package:rest_client/rest_client.dart';
import 'package:riverpod/riverpod.dart';

import '../models/models.dart';
import '../repositories/impl/impls.dart';
import '../repositories/interface/interfaces.dart';
import 'notifiers/notifiers.dart';

mixin AppProviders {
  final confirmPin = StateProvider<String>((ref) => '');

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

  final openConfirmOverlay = StateProvider<bool>((ref) => false);

  final openPersonalInfoOverlay = StateProvider<bool>((ref) => false);

  final restClient =
      Provider<RestClient>((ref) => ClientFactory().createMockClient());

  final storageRepo = Provider<StorageRepo>(StorageRepoImpl.new);

  late final colorTheme =
      StateNotifierProvider<ColorThemeNotifier, ColorTheme>((ref) {
    return ColorThemeNotifier(
      ColorTheme.system,
      ref: ref,
      navigatorKey: navigatorKey,
      user: user,
    );
  });

  // TODO: do not forget ot override it after auth
  late final user = StateNotifierProvider<UserNotifier, User>((ref) {
    return UserNotifier(
      const NotAuthorizedUser(),
      onLogOut: () {
        ref.read(openConfirmOverlay.notifier).state = false;
        ref.read(openPersonalInfoOverlay.notifier).state = false;
        ref.read(confirmPin.notifier).state = '';
      },
    );
  });
}
