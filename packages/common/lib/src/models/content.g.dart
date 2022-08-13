// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Content _$$_ContentFromJson(Map<String, dynamic> json) => _$_Content(
      id: json['id'] as int,
      text: json['text'] as String,
      photos:
          (json['photos'] as List<dynamic>).map((e) => e as String).toList(),
      videos:
          (json['videos'] as List<dynamic>).map((e) => e as String).toList(),
      audios:
          (json['audios'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_ContentToJson(_$_Content instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'photos': instance.photos,
      'videos': instance.videos,
      'audios': instance.audios,
    };
