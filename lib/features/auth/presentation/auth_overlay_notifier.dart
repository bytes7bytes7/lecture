import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_overlay_notifier.freezed.dart';

@freezed
class AuthOverlayConfig with _$AuthOverlayConfig {
  const factory AuthOverlayConfig({
    required bool showVerify,
    required bool showSignIn,
    required bool showPersonalInfo,
    required bool showRecovery,
    required bool showChangePasswd,
  }) = _AuthOverlayConfig;

  factory AuthOverlayConfig.allOff() => const _AuthOverlayConfig(
        showVerify: false,
        showSignIn: false,
        showPersonalInfo: false,
        showRecovery: false,
        showChangePasswd: false,
      );
}

class AuthOverlayNotifier extends StateNotifier<AuthOverlayConfig> {
  AuthOverlayNotifier() : super(AuthOverlayConfig.allOff());

  set newState(AuthOverlayConfig newValue) => state = newValue;
}
