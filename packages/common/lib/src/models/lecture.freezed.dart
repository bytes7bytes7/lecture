// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'lecture.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Lecture _$LectureFromJson(Map<String, dynamic> json) {
  return _Lecture.fromJson(json);
}

/// @nodoc
mixin _$Lecture {
  int get id => throw _privateConstructorUsedError;
  String get institution => throw _privateConstructorUsedError;
  String get subject => throw _privateConstructorUsedError;
  String get topic => throw _privateConstructorUsedError;
  String get lecturer => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  User get author => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LectureCopyWith<Lecture> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LectureCopyWith<$Res> {
  factory $LectureCopyWith(Lecture value, $Res Function(Lecture) then) =
      _$LectureCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String institution,
      String subject,
      String topic,
      String lecturer,
      String date,
      double rating,
      Status status,
      User author});

  $UserCopyWith<$Res> get author;
}

/// @nodoc
class _$LectureCopyWithImpl<$Res> implements $LectureCopyWith<$Res> {
  _$LectureCopyWithImpl(this._value, this._then);

  final Lecture _value;
  // ignore: unused_field
  final $Res Function(Lecture) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? institution = freezed,
    Object? subject = freezed,
    Object? topic = freezed,
    Object? lecturer = freezed,
    Object? date = freezed,
    Object? rating = freezed,
    Object? status = freezed,
    Object? author = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      institution: institution == freezed
          ? _value.institution
          : institution // ignore: cast_nullable_to_non_nullable
              as String,
      subject: subject == freezed
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      topic: topic == freezed
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String,
      lecturer: lecturer == freezed
          ? _value.lecturer
          : lecturer // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  @override
  $UserCopyWith<$Res> get author {
    return $UserCopyWith<$Res>(_value.author, (value) {
      return _then(_value.copyWith(author: value));
    });
  }
}

/// @nodoc
abstract class _$$_LectureCopyWith<$Res> implements $LectureCopyWith<$Res> {
  factory _$$_LectureCopyWith(
          _$_Lecture value, $Res Function(_$_Lecture) then) =
      __$$_LectureCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String institution,
      String subject,
      String topic,
      String lecturer,
      String date,
      double rating,
      Status status,
      User author});

  @override
  $UserCopyWith<$Res> get author;
}

/// @nodoc
class __$$_LectureCopyWithImpl<$Res> extends _$LectureCopyWithImpl<$Res>
    implements _$$_LectureCopyWith<$Res> {
  __$$_LectureCopyWithImpl(_$_Lecture _value, $Res Function(_$_Lecture) _then)
      : super(_value, (v) => _then(v as _$_Lecture));

  @override
  _$_Lecture get _value => super._value as _$_Lecture;

  @override
  $Res call({
    Object? id = freezed,
    Object? institution = freezed,
    Object? subject = freezed,
    Object? topic = freezed,
    Object? lecturer = freezed,
    Object? date = freezed,
    Object? rating = freezed,
    Object? status = freezed,
    Object? author = freezed,
  }) {
    return _then(_$_Lecture(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      institution: institution == freezed
          ? _value.institution
          : institution // ignore: cast_nullable_to_non_nullable
              as String,
      subject: subject == freezed
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      topic: topic == freezed
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String,
      lecturer: lecturer == freezed
          ? _value.lecturer
          : lecturer // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Lecture implements _Lecture {
  const _$_Lecture(
      {required this.id,
      required this.institution,
      required this.subject,
      required this.topic,
      required this.lecturer,
      required this.date,
      required this.rating,
      required this.status,
      required this.author});

  factory _$_Lecture.fromJson(Map<String, dynamic> json) =>
      _$$_LectureFromJson(json);

  @override
  final int id;
  @override
  final String institution;
  @override
  final String subject;
  @override
  final String topic;
  @override
  final String lecturer;
  @override
  final String date;
  @override
  final double rating;
  @override
  final Status status;
  @override
  final User author;

  @override
  String toString() {
    return 'Lecture(id: $id, institution: $institution, subject: $subject, topic: $topic, lecturer: $lecturer, date: $date, rating: $rating, status: $status, author: $author)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Lecture &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.institution, institution) &&
            const DeepCollectionEquality().equals(other.subject, subject) &&
            const DeepCollectionEquality().equals(other.topic, topic) &&
            const DeepCollectionEquality().equals(other.lecturer, lecturer) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other.rating, rating) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.author, author));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(institution),
      const DeepCollectionEquality().hash(subject),
      const DeepCollectionEquality().hash(topic),
      const DeepCollectionEquality().hash(lecturer),
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(rating),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(author));

  @JsonKey(ignore: true)
  @override
  _$$_LectureCopyWith<_$_Lecture> get copyWith =>
      __$$_LectureCopyWithImpl<_$_Lecture>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LectureToJson(
      this,
    );
  }
}

abstract class _Lecture implements Lecture {
  const factory _Lecture(
      {required final int id,
      required final String institution,
      required final String subject,
      required final String topic,
      required final String lecturer,
      required final String date,
      required final double rating,
      required final Status status,
      required final User author}) = _$_Lecture;

  factory _Lecture.fromJson(Map<String, dynamic> json) = _$_Lecture.fromJson;

  @override
  int get id;
  @override
  String get institution;
  @override
  String get subject;
  @override
  String get topic;
  @override
  String get lecturer;
  @override
  String get date;
  @override
  double get rating;
  @override
  Status get status;
  @override
  User get author;
  @override
  @JsonKey(ignore: true)
  _$$_LectureCopyWith<_$_Lecture> get copyWith =>
      throw _privateConstructorUsedError;
}
