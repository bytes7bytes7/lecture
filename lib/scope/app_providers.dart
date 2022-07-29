import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_quotes_quill/all.dart';
import 'package:rest_client/rest_client.dart';

import '../models/models.dart';
import '../repositories/impl/impls.dart';
import '../repositories/interface/interfaces.dart';
import 'src/export.dart';

mixin AppProviders {
  late final colorTheme =
      StateNotifierProvider<ColorThemeNotifier, ColorTheme>((ref) {
    return ColorThemeNotifier(
      ColorTheme.system,
      ref: ref,
      navigatorKey: navigatorKey,
      user: user,
    );
  });

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

  final restClient =
      Provider<RestClient>((ref) => ClientFactory().createMockClient());

  final storageRepo = Provider<StorageRepo>(StorageRepoImpl.new);

  final showChangePasswdOverlay = StateProvider<bool>((ref) => false);

  final showPersonalInfoOverlay = StateProvider<bool>((ref) => false);

  final showConfirmOverlay = StateProvider<bool>((ref) => false);

  final showRecoveryOverlay = StateProvider<bool>((ref) => false);

  final showSignInOverlay = StateProvider<bool>((ref) => false);
  
  final authState = StateProvider<AuthState>((ref) => AuthState.signUp);

  // TODO: do not forget ot override it after auth
  late final user = StateNotifierProvider<UserNotifier, User>((ref) {
    return UserNotifier(
      const NotAuthorizedUser(),
      onLogOut: () {
        ref.read(showChangePasswdOverlay.notifier).state = false;
        ref.read(showPersonalInfoOverlay.notifier).state = false;
        ref.read(showConfirmOverlay.notifier).state = false;
        ref.read(showRecoveryOverlay.notifier).state = false;
        ref.read(showSignInOverlay.notifier).state = false;
        ref.read(confirmPin.notifier).state = '';
      },
    );
  });
}
