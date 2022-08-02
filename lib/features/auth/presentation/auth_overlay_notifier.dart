import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_overlay_notifier.freezed.dart';

@freezed
class AuthOverlayConfig with _$AuthOverlayConfig {
  const factory AuthOverlayConfig({
    required bool openVerify,
    required bool openSignIn,
    required bool openPersonalInfo,
    required bool openRecovery,
    required bool openChangePasswd,
  }) = _AuthOverlayConfig;

  factory AuthOverlayConfig.allOff() => const _AuthOverlayConfig(
        openVerify: false,
        openSignIn: false,
        openPersonalInfo: false,
        openRecovery: false,
        openChangePasswd: false,
      );
}

class AuthOverlayNotifier extends StateNotifier<AuthOverlayConfig> {
  AuthOverlayNotifier() : super(AuthOverlayConfig.allOff());

  set newState(AuthOverlayConfig newValue) => state = newValue;
}
