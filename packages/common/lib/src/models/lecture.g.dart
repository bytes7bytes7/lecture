// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lecture.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Lecture _$$_LectureFromJson(Map<String, dynamic> json) => _$_Lecture(
      id: json['id'] as int,
      institution: json['institution'] as String,
      subject: json['subject'] as String,
      topic: json['topic'] as String,
      lecturer: json['lecturer'] as String,
      date: json['date'] as String,
      rating: (json['rating'] as num).toDouble(),
      status: $enumDecode(_$StatusEnumMap, json['status']),
      author: User.fromJson(json['author'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_LectureToJson(_$_Lecture instance) =>
    <String, dynamic>{
      'id': instance.id,
      'institution': instance.institution,
      'subject': instance.subject,
      'topic': instance.topic,
      'lecturer': instance.lecturer,
      'date': instance.date,
      'rating': instance.rating,
      'status': _$StatusEnumMap[instance.status]!,
      'author': instance.author.toJson(),
    };

const _$StatusEnumMap = {
  Status.onMod: 'on_moderation',
  Status.declined: 'declined',
  Status.notPublished: 'not_published',
  Status.published: 'published',
};
