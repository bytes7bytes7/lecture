// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_overlay_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthOverlayConfig {
  bool get showVerify => throw _privateConstructorUsedError;
  bool get showSignIn => throw _privateConstructorUsedError;
  bool get showPersonalInfo => throw _privateConstructorUsedError;
  bool get showRecovery => throw _privateConstructorUsedError;
  bool get showChangePasswd => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthOverlayConfigCopyWith<AuthOverlayConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthOverlayConfigCopyWith<$Res> {
  factory $AuthOverlayConfigCopyWith(
          AuthOverlayConfig value, $Res Function(AuthOverlayConfig) then) =
      _$AuthOverlayConfigCopyWithImpl<$Res>;
  $Res call(
      {bool showVerify,
      bool showSignIn,
      bool showPersonalInfo,
      bool showRecovery,
      bool showChangePasswd});
}

/// @nodoc
class _$AuthOverlayConfigCopyWithImpl<$Res>
    implements $AuthOverlayConfigCopyWith<$Res> {
  _$AuthOverlayConfigCopyWithImpl(this._value, this._then);

  final AuthOverlayConfig _value;
  // ignore: unused_field
  final $Res Function(AuthOverlayConfig) _then;

  @override
  $Res call({
    Object? showVerify = freezed,
    Object? showSignIn = freezed,
    Object? showPersonalInfo = freezed,
    Object? showRecovery = freezed,
    Object? showChangePasswd = freezed,
  }) {
    return _then(_value.copyWith(
      showVerify: showVerify == freezed
          ? _value.showVerify
          : showVerify // ignore: cast_nullable_to_non_nullable
              as bool,
      showSignIn: showSignIn == freezed
          ? _value.showSignIn
          : showSignIn // ignore: cast_nullable_to_non_nullable
              as bool,
      showPersonalInfo: showPersonalInfo == freezed
          ? _value.showPersonalInfo
          : showPersonalInfo // ignore: cast_nullable_to_non_nullable
              as bool,
      showRecovery: showRecovery == freezed
          ? _value.showRecovery
          : showRecovery // ignore: cast_nullable_to_non_nullable
              as bool,
      showChangePasswd: showChangePasswd == freezed
          ? _value.showChangePasswd
          : showChangePasswd // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_AuthOverlayConfigCopyWith<$Res>
    implements $AuthOverlayConfigCopyWith<$Res> {
  factory _$$_AuthOverlayConfigCopyWith(_$_AuthOverlayConfig value,
          $Res Function(_$_AuthOverlayConfig) then) =
      __$$_AuthOverlayConfigCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool showVerify,
      bool showSignIn,
      bool showPersonalInfo,
      bool showRecovery,
      bool showChangePasswd});
}

/// @nodoc
class __$$_AuthOverlayConfigCopyWithImpl<$Res>
    extends _$AuthOverlayConfigCopyWithImpl<$Res>
    implements _$$_AuthOverlayConfigCopyWith<$Res> {
  __$$_AuthOverlayConfigCopyWithImpl(
      _$_AuthOverlayConfig _value, $Res Function(_$_AuthOverlayConfig) _then)
      : super(_value, (v) => _then(v as _$_AuthOverlayConfig));

  @override
  _$_AuthOverlayConfig get _value => super._value as _$_AuthOverlayConfig;

  @override
  $Res call({
    Object? showVerify = freezed,
    Object? showSignIn = freezed,
    Object? showPersonalInfo = freezed,
    Object? showRecovery = freezed,
    Object? showChangePasswd = freezed,
  }) {
    return _then(_$_AuthOverlayConfig(
      showVerify: showVerify == freezed
          ? _value.showVerify
          : showVerify // ignore: cast_nullable_to_non_nullable
              as bool,
      showSignIn: showSignIn == freezed
          ? _value.showSignIn
          : showSignIn // ignore: cast_nullable_to_non_nullable
              as bool,
      showPersonalInfo: showPersonalInfo == freezed
          ? _value.showPersonalInfo
          : showPersonalInfo // ignore: cast_nullable_to_non_nullable
              as bool,
      showRecovery: showRecovery == freezed
          ? _value.showRecovery
          : showRecovery // ignore: cast_nullable_to_non_nullable
              as bool,
      showChangePasswd: showChangePasswd == freezed
          ? _value.showChangePasswd
          : showChangePasswd // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AuthOverlayConfig implements _AuthOverlayConfig {
  const _$_AuthOverlayConfig(
      {required this.showVerify,
      required this.showSignIn,
      required this.showPersonalInfo,
      required this.showRecovery,
      required this.showChangePasswd});

  @override
  final bool showVerify;
  @override
  final bool showSignIn;
  @override
  final bool showPersonalInfo;
  @override
  final bool showRecovery;
  @override
  final bool showChangePasswd;

  @override
  String toString() {
    return 'AuthOverlayConfig(showVerify: $showVerify, showSignIn: $showSignIn, showPersonalInfo: $showPersonalInfo, showRecovery: $showRecovery, showChangePasswd: $showChangePasswd)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthOverlayConfig &&
            const DeepCollectionEquality()
                .equals(other.showVerify, showVerify) &&
            const DeepCollectionEquality()
                .equals(other.showSignIn, showSignIn) &&
            const DeepCollectionEquality()
                .equals(other.showPersonalInfo, showPersonalInfo) &&
            const DeepCollectionEquality()
                .equals(other.showRecovery, showRecovery) &&
            const DeepCollectionEquality()
                .equals(other.showChangePasswd, showChangePasswd));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(showVerify),
      const DeepCollectionEquality().hash(showSignIn),
      const DeepCollectionEquality().hash(showPersonalInfo),
      const DeepCollectionEquality().hash(showRecovery),
      const DeepCollectionEquality().hash(showChangePasswd));

  @JsonKey(ignore: true)
  @override
  _$$_AuthOverlayConfigCopyWith<_$_AuthOverlayConfig> get copyWith =>
      __$$_AuthOverlayConfigCopyWithImpl<_$_AuthOverlayConfig>(
          this, _$identity);
}

abstract class _AuthOverlayConfig implements AuthOverlayConfig {
  const factory _AuthOverlayConfig(
      {required final bool showVerify,
      required final bool showSignIn,
      required final bool showPersonalInfo,
      required final bool showRecovery,
      required final bool showChangePasswd}) = _$_AuthOverlayConfig;

  @override
  bool get showVerify => throw _privateConstructorUsedError;
  @override
  bool get showSignIn => throw _privateConstructorUsedError;
  @override
  bool get showPersonalInfo => throw _privateConstructorUsedError;
  @override
  bool get showRecovery => throw _privateConstructorUsedError;
  @override
  bool get showChangePasswd => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_AuthOverlayConfigCopyWith<_$_AuthOverlayConfig> get copyWith =>
      throw _privateConstructorUsedError;
}
