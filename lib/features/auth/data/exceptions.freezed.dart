// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'exceptions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthException {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loginAlreadyExists,
    required TResult Function() wrongCred,
    required TResult Function() wrongCode,
    required TResult Function() noLoginFound,
    required TResult Function() unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loginAlreadyExists,
    TResult Function()? wrongCred,
    TResult Function()? wrongCode,
    TResult Function()? noLoginFound,
    TResult Function()? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loginAlreadyExists,
    TResult Function()? wrongCred,
    TResult Function()? wrongCode,
    TResult Function()? noLoginFound,
    TResult Function()? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginAlreadyInUse value) loginAlreadyExists,
    required TResult Function(WrongCred value) wrongCred,
    required TResult Function(WrongCode value) wrongCode,
    required TResult Function(NoLoginFound value) noLoginFound,
    required TResult Function(Unknown value) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoginAlreadyInUse value)? loginAlreadyExists,
    TResult Function(WrongCred value)? wrongCred,
    TResult Function(WrongCode value)? wrongCode,
    TResult Function(NoLoginFound value)? noLoginFound,
    TResult Function(Unknown value)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginAlreadyInUse value)? loginAlreadyExists,
    TResult Function(WrongCred value)? wrongCred,
    TResult Function(WrongCode value)? wrongCode,
    TResult Function(NoLoginFound value)? noLoginFound,
    TResult Function(Unknown value)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthExceptionCopyWith<$Res> {
  factory $AuthExceptionCopyWith(
          AuthException value, $Res Function(AuthException) then) =
      _$AuthExceptionCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthExceptionCopyWithImpl<$Res>
    implements $AuthExceptionCopyWith<$Res> {
  _$AuthExceptionCopyWithImpl(this._value, this._then);

  final AuthException _value;
  // ignore: unused_field
  final $Res Function(AuthException) _then;
}

/// @nodoc
abstract class _$$LoginAlreadyInUseCopyWith<$Res> {
  factory _$$LoginAlreadyInUseCopyWith(
          _$LoginAlreadyInUse value, $Res Function(_$LoginAlreadyInUse) then) =
      __$$LoginAlreadyInUseCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoginAlreadyInUseCopyWithImpl<$Res>
    extends _$AuthExceptionCopyWithImpl<$Res>
    implements _$$LoginAlreadyInUseCopyWith<$Res> {
  __$$LoginAlreadyInUseCopyWithImpl(
      _$LoginAlreadyInUse _value, $Res Function(_$LoginAlreadyInUse) _then)
      : super(_value, (v) => _then(v as _$LoginAlreadyInUse));

  @override
  _$LoginAlreadyInUse get _value => super._value as _$LoginAlreadyInUse;
}

/// @nodoc

class _$LoginAlreadyInUse implements LoginAlreadyInUse {
  const _$LoginAlreadyInUse();

  @override
  String toString() {
    return 'AuthException.loginAlreadyExists()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoginAlreadyInUse);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loginAlreadyExists,
    required TResult Function() wrongCred,
    required TResult Function() wrongCode,
    required TResult Function() noLoginFound,
    required TResult Function() unknown,
  }) {
    return loginAlreadyExists();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loginAlreadyExists,
    TResult Function()? wrongCred,
    TResult Function()? wrongCode,
    TResult Function()? noLoginFound,
    TResult Function()? unknown,
  }) {
    return loginAlreadyExists?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loginAlreadyExists,
    TResult Function()? wrongCred,
    TResult Function()? wrongCode,
    TResult Function()? noLoginFound,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (loginAlreadyExists != null) {
      return loginAlreadyExists();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginAlreadyInUse value) loginAlreadyExists,
    required TResult Function(WrongCred value) wrongCred,
    required TResult Function(WrongCode value) wrongCode,
    required TResult Function(NoLoginFound value) noLoginFound,
    required TResult Function(Unknown value) unknown,
  }) {
    return loginAlreadyExists(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoginAlreadyInUse value)? loginAlreadyExists,
    TResult Function(WrongCred value)? wrongCred,
    TResult Function(WrongCode value)? wrongCode,
    TResult Function(NoLoginFound value)? noLoginFound,
    TResult Function(Unknown value)? unknown,
  }) {
    return loginAlreadyExists?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginAlreadyInUse value)? loginAlreadyExists,
    TResult Function(WrongCred value)? wrongCred,
    TResult Function(WrongCode value)? wrongCode,
    TResult Function(NoLoginFound value)? noLoginFound,
    TResult Function(Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (loginAlreadyExists != null) {
      return loginAlreadyExists(this);
    }
    return orElse();
  }
}

abstract class LoginAlreadyInUse implements AuthException {
  const factory LoginAlreadyInUse() = _$LoginAlreadyInUse;
}

/// @nodoc
abstract class _$$WrongCredCopyWith<$Res> {
  factory _$$WrongCredCopyWith(
          _$WrongCred value, $Res Function(_$WrongCred) then) =
      __$$WrongCredCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WrongCredCopyWithImpl<$Res> extends _$AuthExceptionCopyWithImpl<$Res>
    implements _$$WrongCredCopyWith<$Res> {
  __$$WrongCredCopyWithImpl(
      _$WrongCred _value, $Res Function(_$WrongCred) _then)
      : super(_value, (v) => _then(v as _$WrongCred));

  @override
  _$WrongCred get _value => super._value as _$WrongCred;
}

/// @nodoc

class _$WrongCred implements WrongCred {
  const _$WrongCred();

  @override
  String toString() {
    return 'AuthException.wrongCred()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$WrongCred);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loginAlreadyExists,
    required TResult Function() wrongCred,
    required TResult Function() wrongCode,
    required TResult Function() noLoginFound,
    required TResult Function() unknown,
  }) {
    return wrongCred();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loginAlreadyExists,
    TResult Function()? wrongCred,
    TResult Function()? wrongCode,
    TResult Function()? noLoginFound,
    TResult Function()? unknown,
  }) {
    return wrongCred?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loginAlreadyExists,
    TResult Function()? wrongCred,
    TResult Function()? wrongCode,
    TResult Function()? noLoginFound,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (wrongCred != null) {
      return wrongCred();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginAlreadyInUse value) loginAlreadyExists,
    required TResult Function(WrongCred value) wrongCred,
    required TResult Function(WrongCode value) wrongCode,
    required TResult Function(NoLoginFound value) noLoginFound,
    required TResult Function(Unknown value) unknown,
  }) {
    return wrongCred(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoginAlreadyInUse value)? loginAlreadyExists,
    TResult Function(WrongCred value)? wrongCred,
    TResult Function(WrongCode value)? wrongCode,
    TResult Function(NoLoginFound value)? noLoginFound,
    TResult Function(Unknown value)? unknown,
  }) {
    return wrongCred?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginAlreadyInUse value)? loginAlreadyExists,
    TResult Function(WrongCred value)? wrongCred,
    TResult Function(WrongCode value)? wrongCode,
    TResult Function(NoLoginFound value)? noLoginFound,
    TResult Function(Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (wrongCred != null) {
      return wrongCred(this);
    }
    return orElse();
  }
}

abstract class WrongCred implements AuthException {
  const factory WrongCred() = _$WrongCred;
}

/// @nodoc
abstract class _$$WrongCodeCopyWith<$Res> {
  factory _$$WrongCodeCopyWith(
          _$WrongCode value, $Res Function(_$WrongCode) then) =
      __$$WrongCodeCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WrongCodeCopyWithImpl<$Res> extends _$AuthExceptionCopyWithImpl<$Res>
    implements _$$WrongCodeCopyWith<$Res> {
  __$$WrongCodeCopyWithImpl(
      _$WrongCode _value, $Res Function(_$WrongCode) _then)
      : super(_value, (v) => _then(v as _$WrongCode));

  @override
  _$WrongCode get _value => super._value as _$WrongCode;
}

/// @nodoc

class _$WrongCode implements WrongCode {
  const _$WrongCode();

  @override
  String toString() {
    return 'AuthException.wrongCode()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$WrongCode);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loginAlreadyExists,
    required TResult Function() wrongCred,
    required TResult Function() wrongCode,
    required TResult Function() noLoginFound,
    required TResult Function() unknown,
  }) {
    return wrongCode();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loginAlreadyExists,
    TResult Function()? wrongCred,
    TResult Function()? wrongCode,
    TResult Function()? noLoginFound,
    TResult Function()? unknown,
  }) {
    return wrongCode?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loginAlreadyExists,
    TResult Function()? wrongCred,
    TResult Function()? wrongCode,
    TResult Function()? noLoginFound,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (wrongCode != null) {
      return wrongCode();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginAlreadyInUse value) loginAlreadyExists,
    required TResult Function(WrongCred value) wrongCred,
    required TResult Function(WrongCode value) wrongCode,
    required TResult Function(NoLoginFound value) noLoginFound,
    required TResult Function(Unknown value) unknown,
  }) {
    return wrongCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoginAlreadyInUse value)? loginAlreadyExists,
    TResult Function(WrongCred value)? wrongCred,
    TResult Function(WrongCode value)? wrongCode,
    TResult Function(NoLoginFound value)? noLoginFound,
    TResult Function(Unknown value)? unknown,
  }) {
    return wrongCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginAlreadyInUse value)? loginAlreadyExists,
    TResult Function(WrongCred value)? wrongCred,
    TResult Function(WrongCode value)? wrongCode,
    TResult Function(NoLoginFound value)? noLoginFound,
    TResult Function(Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (wrongCode != null) {
      return wrongCode(this);
    }
    return orElse();
  }
}

abstract class WrongCode implements AuthException {
  const factory WrongCode() = _$WrongCode;
}

/// @nodoc
abstract class _$$NoLoginFoundCopyWith<$Res> {
  factory _$$NoLoginFoundCopyWith(
          _$NoLoginFound value, $Res Function(_$NoLoginFound) then) =
      __$$NoLoginFoundCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NoLoginFoundCopyWithImpl<$Res>
    extends _$AuthExceptionCopyWithImpl<$Res>
    implements _$$NoLoginFoundCopyWith<$Res> {
  __$$NoLoginFoundCopyWithImpl(
      _$NoLoginFound _value, $Res Function(_$NoLoginFound) _then)
      : super(_value, (v) => _then(v as _$NoLoginFound));

  @override
  _$NoLoginFound get _value => super._value as _$NoLoginFound;
}

/// @nodoc

class _$NoLoginFound implements NoLoginFound {
  const _$NoLoginFound();

  @override
  String toString() {
    return 'AuthException.noLoginFound()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NoLoginFound);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loginAlreadyExists,
    required TResult Function() wrongCred,
    required TResult Function() wrongCode,
    required TResult Function() noLoginFound,
    required TResult Function() unknown,
  }) {
    return noLoginFound();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loginAlreadyExists,
    TResult Function()? wrongCred,
    TResult Function()? wrongCode,
    TResult Function()? noLoginFound,
    TResult Function()? unknown,
  }) {
    return noLoginFound?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loginAlreadyExists,
    TResult Function()? wrongCred,
    TResult Function()? wrongCode,
    TResult Function()? noLoginFound,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (noLoginFound != null) {
      return noLoginFound();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginAlreadyInUse value) loginAlreadyExists,
    required TResult Function(WrongCred value) wrongCred,
    required TResult Function(WrongCode value) wrongCode,
    required TResult Function(NoLoginFound value) noLoginFound,
    required TResult Function(Unknown value) unknown,
  }) {
    return noLoginFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoginAlreadyInUse value)? loginAlreadyExists,
    TResult Function(WrongCred value)? wrongCred,
    TResult Function(WrongCode value)? wrongCode,
    TResult Function(NoLoginFound value)? noLoginFound,
    TResult Function(Unknown value)? unknown,
  }) {
    return noLoginFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginAlreadyInUse value)? loginAlreadyExists,
    TResult Function(WrongCred value)? wrongCred,
    TResult Function(WrongCode value)? wrongCode,
    TResult Function(NoLoginFound value)? noLoginFound,
    TResult Function(Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (noLoginFound != null) {
      return noLoginFound(this);
    }
    return orElse();
  }
}

abstract class NoLoginFound implements AuthException {
  const factory NoLoginFound() = _$NoLoginFound;
}

/// @nodoc
abstract class _$$UnknownCopyWith<$Res> {
  factory _$$UnknownCopyWith(_$Unknown value, $Res Function(_$Unknown) then) =
      __$$UnknownCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnknownCopyWithImpl<$Res> extends _$AuthExceptionCopyWithImpl<$Res>
    implements _$$UnknownCopyWith<$Res> {
  __$$UnknownCopyWithImpl(_$Unknown _value, $Res Function(_$Unknown) _then)
      : super(_value, (v) => _then(v as _$Unknown));

  @override
  _$Unknown get _value => super._value as _$Unknown;
}

/// @nodoc

class _$Unknown implements Unknown {
  const _$Unknown();

  @override
  String toString() {
    return 'AuthException.unknown()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Unknown);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loginAlreadyExists,
    required TResult Function() wrongCred,
    required TResult Function() wrongCode,
    required TResult Function() noLoginFound,
    required TResult Function() unknown,
  }) {
    return unknown();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loginAlreadyExists,
    TResult Function()? wrongCred,
    TResult Function()? wrongCode,
    TResult Function()? noLoginFound,
    TResult Function()? unknown,
  }) {
    return unknown?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loginAlreadyExists,
    TResult Function()? wrongCred,
    TResult Function()? wrongCode,
    TResult Function()? noLoginFound,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginAlreadyInUse value) loginAlreadyExists,
    required TResult Function(WrongCred value) wrongCred,
    required TResult Function(WrongCode value) wrongCode,
    required TResult Function(NoLoginFound value) noLoginFound,
    required TResult Function(Unknown value) unknown,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoginAlreadyInUse value)? loginAlreadyExists,
    TResult Function(WrongCred value)? wrongCred,
    TResult Function(WrongCode value)? wrongCode,
    TResult Function(NoLoginFound value)? noLoginFound,
    TResult Function(Unknown value)? unknown,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginAlreadyInUse value)? loginAlreadyExists,
    TResult Function(WrongCred value)? wrongCred,
    TResult Function(WrongCode value)? wrongCode,
    TResult Function(NoLoginFound value)? noLoginFound,
    TResult Function(Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class Unknown implements AuthException {
  const factory Unknown() = _$Unknown;
}
