// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lecture.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Lecture _$LectureFromJson(Map<String, dynamic> json) => Lecture(
      id: json['id'] as String,
      faculty: json['faculty'] as String,
      level: json['level'] as String,
      subject: json['subject'] as String,
      semester: json['semester'] as int,
      topic: json['topic'] as String,
      content: Content.fromJson(json['content'] as Map<String, dynamic>),
      lecturer: User.fromJson(json['lecturer'] as Map<String, dynamic>),
      date: json['date'] as String,
      rating: (json['rating'] as num).toDouble(),
      author: User.fromJson(json['author'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LectureToJson(Lecture instance) => <String, dynamic>{
      'id': instance.id,
      'faculty': instance.faculty,
      'level': instance.level,
      'subject': instance.subject,
      'semester': instance.semester,
      'topic': instance.topic,
      'content': instance.content,
      'lecturer': instance.lecturer,
      'date': instance.date,
      'rating': instance.rating,
      'author': instance.author,
    };
