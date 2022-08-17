import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../dev.dart' as dev;
import '../extensions/string_ext.dart';
import 'user.dart';

part 'lecture.freezed.dart';

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

enum Status {
  @JsonValue('on_moderation')
  onMod,
  @JsonValue('declined')
  declined,
  @JsonValue('not_published')
  notPublished,
  @JsonValue('published')
  published,
}

extension LectureX on Lecture {
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
}

@freezed
class Lecture with _$Lecture {
  const factory Lecture({
    required int id,
    required String institution,
    required String subject,
    required String topic,
    required String lecturer,
    required String date,
    required double rating,
    required Status status,
    required User author,
  }) = _Lecture;

  factory Lecture.fromJson(Map<String, Object?> json) =>
      _$LectureFromJson(json);

  static Lecture empty(User me) {
    return Lecture(
      id: 0,
      institution: '',
      subject: '',
      topic: '',
      lecturer: '',
      date: '',
      rating: 0,
      status: Status.notPublished,
      author: me,
    );
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

    final status = Status.values[dev.randomInt(Status.values.length)];

    final author = User(
      id: dev.randomInt(pow(10, 6).toInt()),
      firstName:
          dev.randomString(dev.randomInt(4) + 6, noSpace: true).capitalized,
      lastName:
          dev.randomString(dev.randomInt(8) + 6, noSpace: true).capitalized,
      login: '${dev.randomString(dev.randomInt(4) + 6, noSpace: true)}@mail.ru',
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
      status: status,
      author: author,
    );
  }
}
