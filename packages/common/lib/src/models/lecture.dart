import 'dart:math';

import 'package:json_annotation/json_annotation.dart';

import '../dev.dart' as dev;
import '../extensions/string_ext.dart';
import 'user.dart';

part 'lecture.g.dart';

String shortFIO(String longFIO) {
  final lst = longFIO.split(' ');
  switch (lst.length) {
    case 3:
      return '${lst[0]} ${lst[1].split('').first}. ${lst[2].split('').first}.';
    case 2:
      return '${lst[0]} ${lst[1].split('').first}.';
    default:
      return '';
  }
}

enum Rating {
  excellent,
  good,
  bad,
  unknown,
}

@JsonSerializable()
class Lecture {
  const Lecture({
    required this.id,
    required this.institution,
    required this.subject,
    required this.topic,
    required this.lecturer,
    required this.date,
    required this.rating,
    required this.author,
  });

  final int id;
  final String institution;
  final String subject;
  final String topic;
  final String lecturer;
  final String date;
  final double rating;
  final User author;

  factory Lecture.fromJson(Map<String, dynamic> json) =>
      _$LectureFromJson(json);

  Map<String, dynamic> toJson() => _$LectureToJson(this);

  Rating getRating() {
    if (rating >= 4.0) {
      return Rating.excellent;
    } else if (rating >= 3.0) {
      return Rating.good;
    } else if (rating == 0.0) {
      return Rating.unknown;
    }

    return Rating.bad;
  }

  // TODO: remove it
  static Lecture random({bool isPublished = true}) {
    final id = dev.randomInt(pow(10, 6).toInt());
    final institution = dev.randomString(dev.randomInt(10) + 10).capitalized;
    final subject = dev.randomString(dev.randomInt(10) + 10).capitalized;
    final topic = dev.randomString(dev.randomInt(5) + 10).capitalized;

    final year = (dev.randomInt(5) + 2015).toString();

    final month = (dev.randomInt(12) + 1).toString().padLeft(2, '0');

    final day = (dev.randomInt(28) + 1).toString().padLeft(2, '0');

    final rating = dev.randomDouble(5);

    final firstName =
        dev.randomString(dev.randomInt(4) + 6, noSpace: true).capitalized;
    final middleName =
        dev.randomString(dev.randomInt(4) + 6, noSpace: true).capitalized;
    final lastName =
        dev.randomString(dev.randomInt(8) + 6, noSpace: true).capitalized;

    final lecturer = [lastName, firstName, middleName].join(' ');

    final author = User(
      id: dev.randomInt(pow(10, 6).toInt()),
      firstName:
          dev.randomString(dev.randomInt(4) + 6, noSpace: true).capitalized,
      lastName:
          dev.randomString(dev.randomInt(8) + 6, noSpace: true).capitalized,
      email: '${dev.randomString(dev.randomInt(4) + 6, noSpace: true)}@mail.ru',
      middleName: dev.randomInt(2) == 1
          ? dev.randomString(dev.randomInt(6) + 8, noSpace: true).capitalized
          : null,
      avatar: dev.randomInt(2) == 1
          ? dev.randomString(dev.randomInt(20) + 10, noSpace: true, useEn: true)
          : null,
    );

    return Lecture(
      id: id,
      institution: institution,
      subject: subject,
      topic: topic,
      lecturer: lecturer,
      date: '$day.$month.$year',
      rating: isPublished ? rating : 0,
      author: author,
    );
  }
}
