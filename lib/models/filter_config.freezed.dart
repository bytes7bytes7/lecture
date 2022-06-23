// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'filter_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FilterConfig {
  String get institution => throw _privateConstructorUsedError;
  String get subject => throw _privateConstructorUsedError;
  String get lecturer => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;
  String get beginDate => throw _privateConstructorUsedError;
  String get endDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FilterConfigCopyWith<FilterConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterConfigCopyWith<$Res> {
  factory $FilterConfigCopyWith(
          FilterConfig value, $Res Function(FilterConfig) then) =
      _$FilterConfigCopyWithImpl<$Res>;
  $Res call(
      {String institution,
      String subject,
      String lecturer,
      String author,
      String beginDate,
      String endDate});
}

/// @nodoc
class _$FilterConfigCopyWithImpl<$Res> implements $FilterConfigCopyWith<$Res> {
  _$FilterConfigCopyWithImpl(this._value, this._then);

  final FilterConfig _value;
  // ignore: unused_field
  final $Res Function(FilterConfig) _then;

  @override
  $Res call({
    Object? institution = freezed,
    Object? subject = freezed,
    Object? lecturer = freezed,
    Object? author = freezed,
    Object? beginDate = freezed,
    Object? endDate = freezed,
  }) {
    return _then(_value.copyWith(
      institution: institution == freezed
          ? _value.institution
          : institution // ignore: cast_nullable_to_non_nullable
              as String,
      subject: subject == freezed
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      lecturer: lecturer == freezed
          ? _value.lecturer
          : lecturer // ignore: cast_nullable_to_non_nullable
              as String,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      beginDate: beginDate == freezed
          ? _value.beginDate
          : beginDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: endDate == freezed
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_FilterConfigCopyWith<$Res>
    implements $FilterConfigCopyWith<$Res> {
  factory _$$_FilterConfigCopyWith(
          _$_FilterConfig value, $Res Function(_$_FilterConfig) then) =
      __$$_FilterConfigCopyWithImpl<$Res>;
  @override
  $Res call(
      {String institution,
      String subject,
      String lecturer,
      String author,
      String beginDate,
      String endDate});
}

/// @nodoc
class __$$_FilterConfigCopyWithImpl<$Res>
    extends _$FilterConfigCopyWithImpl<$Res>
    implements _$$_FilterConfigCopyWith<$Res> {
  __$$_FilterConfigCopyWithImpl(
      _$_FilterConfig _value, $Res Function(_$_FilterConfig) _then)
      : super(_value, (v) => _then(v as _$_FilterConfig));

  @override
  _$_FilterConfig get _value => super._value as _$_FilterConfig;

  @override
  $Res call({
    Object? institution = freezed,
    Object? subject = freezed,
    Object? lecturer = freezed,
    Object? author = freezed,
    Object? beginDate = freezed,
    Object? endDate = freezed,
  }) {
    return _then(_$_FilterConfig(
      institution: institution == freezed
          ? _value.institution
          : institution // ignore: cast_nullable_to_non_nullable
              as String,
      subject: subject == freezed
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      lecturer: lecturer == freezed
          ? _value.lecturer
          : lecturer // ignore: cast_nullable_to_non_nullable
              as String,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      beginDate: beginDate == freezed
          ? _value.beginDate
          : beginDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: endDate == freezed
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_FilterConfig implements _FilterConfig {
  const _$_FilterConfig(
      {required this.institution,
      required this.subject,
      required this.lecturer,
      required this.author,
      required this.beginDate,
      required this.endDate});

  @override
  final String institution;
  @override
  final String subject;
  @override
  final String lecturer;
  @override
  final String author;
  @override
  final String beginDate;
  @override
  final String endDate;

  @override
  String toString() {
    return 'FilterConfig(institution: $institution, subject: $subject, lecturer: $lecturer, author: $author, beginDate: $beginDate, endDate: $endDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FilterConfig &&
            const DeepCollectionEquality()
                .equals(other.institution, institution) &&
            const DeepCollectionEquality().equals(other.subject, subject) &&
            const DeepCollectionEquality().equals(other.lecturer, lecturer) &&
            const DeepCollectionEquality().equals(other.author, author) &&
            const DeepCollectionEquality().equals(other.beginDate, beginDate) &&
            const DeepCollectionEquality().equals(other.endDate, endDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(institution),
      const DeepCollectionEquality().hash(subject),
      const DeepCollectionEquality().hash(lecturer),
      const DeepCollectionEquality().hash(author),
      const DeepCollectionEquality().hash(beginDate),
      const DeepCollectionEquality().hash(endDate));

  @JsonKey(ignore: true)
  @override
  _$$_FilterConfigCopyWith<_$_FilterConfig> get copyWith =>
      __$$_FilterConfigCopyWithImpl<_$_FilterConfig>(this, _$identity);
}

abstract class _FilterConfig implements FilterConfig {
  const factory _FilterConfig(
      {required final String institution,
      required final String subject,
      required final String lecturer,
      required final String author,
      required final String beginDate,
      required final String endDate}) = _$_FilterConfig;

  @override
  String get institution => throw _privateConstructorUsedError;
  @override
  String get subject => throw _privateConstructorUsedError;
  @override
  String get lecturer => throw _privateConstructorUsedError;
  @override
  String get author => throw _privateConstructorUsedError;
  @override
  String get beginDate => throw _privateConstructorUsedError;
  @override
  String get endDate => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_FilterConfigCopyWith<_$_FilterConfig> get copyWith =>
      throw _privateConstructorUsedError;
}
