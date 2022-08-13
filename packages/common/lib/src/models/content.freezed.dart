// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'content.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Content _$ContentFromJson(Map<String, dynamic> json) {
  return _Content.fromJson(json);
}

/// @nodoc
mixin _$Content {
  int get id => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  List<String> get photos => throw _privateConstructorUsedError;
  List<String> get videos => throw _privateConstructorUsedError;
  List<String> get audios => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContentCopyWith<Content> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentCopyWith<$Res> {
  factory $ContentCopyWith(Content value, $Res Function(Content) then) =
      _$ContentCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String text,
      List<String> photos,
      List<String> videos,
      List<String> audios});
}

/// @nodoc
class _$ContentCopyWithImpl<$Res> implements $ContentCopyWith<$Res> {
  _$ContentCopyWithImpl(this._value, this._then);

  final Content _value;
  // ignore: unused_field
  final $Res Function(Content) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? text = freezed,
    Object? photos = freezed,
    Object? videos = freezed,
    Object? audios = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      photos: photos == freezed
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<String>,
      videos: videos == freezed
          ? _value.videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<String>,
      audios: audios == freezed
          ? _value.audios
          : audios // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$$_ContentCopyWith<$Res> implements $ContentCopyWith<$Res> {
  factory _$$_ContentCopyWith(
          _$_Content value, $Res Function(_$_Content) then) =
      __$$_ContentCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String text,
      List<String> photos,
      List<String> videos,
      List<String> audios});
}

/// @nodoc
class __$$_ContentCopyWithImpl<$Res> extends _$ContentCopyWithImpl<$Res>
    implements _$$_ContentCopyWith<$Res> {
  __$$_ContentCopyWithImpl(_$_Content _value, $Res Function(_$_Content) _then)
      : super(_value, (v) => _then(v as _$_Content));

  @override
  _$_Content get _value => super._value as _$_Content;

  @override
  $Res call({
    Object? id = freezed,
    Object? text = freezed,
    Object? photos = freezed,
    Object? videos = freezed,
    Object? audios = freezed,
  }) {
    return _then(_$_Content(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      photos: photos == freezed
          ? _value._photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<String>,
      videos: videos == freezed
          ? _value._videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<String>,
      audios: audios == freezed
          ? _value._audios
          : audios // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Content implements _Content {
  const _$_Content(
      {required this.id,
      required this.text,
      required final List<String> photos,
      required final List<String> videos,
      required final List<String> audios})
      : _photos = photos,
        _videos = videos,
        _audios = audios;

  factory _$_Content.fromJson(Map<String, dynamic> json) =>
      _$$_ContentFromJson(json);

  @override
  final int id;
  @override
  final String text;
  final List<String> _photos;
  @override
  List<String> get photos {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_photos);
  }

  final List<String> _videos;
  @override
  List<String> get videos {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_videos);
  }

  final List<String> _audios;
  @override
  List<String> get audios {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_audios);
  }

  @override
  String toString() {
    return 'Content(id: $id, text: $text, photos: $photos, videos: $videos, audios: $audios)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Content &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.text, text) &&
            const DeepCollectionEquality().equals(other._photos, _photos) &&
            const DeepCollectionEquality().equals(other._videos, _videos) &&
            const DeepCollectionEquality().equals(other._audios, _audios));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(text),
      const DeepCollectionEquality().hash(_photos),
      const DeepCollectionEquality().hash(_videos),
      const DeepCollectionEquality().hash(_audios));

  @JsonKey(ignore: true)
  @override
  _$$_ContentCopyWith<_$_Content> get copyWith =>
      __$$_ContentCopyWithImpl<_$_Content>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ContentToJson(
      this,
    );
  }
}

abstract class _Content implements Content {
  const factory _Content(
      {required final int id,
      required final String text,
      required final List<String> photos,
      required final List<String> videos,
      required final List<String> audios}) = _$_Content;

  factory _Content.fromJson(Map<String, dynamic> json) = _$_Content.fromJson;

  @override
  int get id;
  @override
  String get text;
  @override
  List<String> get photos;
  @override
  List<String> get videos;
  @override
  List<String> get audios;
  @override
  @JsonKey(ignore: true)
  _$$_ContentCopyWith<_$_Content> get copyWith =>
      throw _privateConstructorUsedError;
}
