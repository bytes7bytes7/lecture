import 'dart:math';

import 'package:json_annotation/json_annotation.dart';

import '../../rest_client.dart';
import '../constants/api.dart' as const_api;
import '../extensions/string_ext.dart';
import 'content.dart';
import 'user.dart';

part 'lecture.g.dart';

const _ru = 'йцукенгшщзхъфывапролджэячсмитьбю ';
const _en = 'qwertyuiopasdfghjklzxcvbnm ';
final _rand = Random();

int _randomInt(int max) {
  if (max <= 0) {
    return -1;
  }

  return _rand.nextInt(max);
}

String _randomString(int length, {bool noSpace = false, bool useEn = false}) {
  var chars = _ru;

  if (useEn) {
    chars = _en;
  }

  if (noSpace) {
    chars = chars.replaceAll(' ', '');
  }

  return String.fromCharCodes(
    Iterable.generate(
      length,
      (_) => chars.codeUnitAt(_randomInt(chars.length)),
    ),
  );
}

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
    required this.content,
    required this.lecturer,
    required this.date,
    required this.rating,
    required this.author,
  });

  final int id;
  final String institution;
  final String subject;
  final String topic;
  final Content? content;
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
    final id = _randomInt(pow(10, 6).toInt());
    final institution = const_api.unknownStr;
    final subject = const_api.unknownStr;
    final topic = _randomString(_randomInt(10) + 10).capitalize;
    final text = _randomString(_randomInt(300) + 5000);
    final photos = List<String>.generate(
      _randomInt(10),
      (i) => _randomString(i, noSpace: true, useEn: true),
    );
    final videos = List<String>.generate(
      _randomInt(10),
      (i) => _randomString(i, noSpace: true, useEn: true),
    );
    final audios = List<String>.generate(
      _randomInt(10),
      (i) => _randomString(i, noSpace: true, useEn: true),
    );

    final year = (_randomInt(5) + 2015).toString();

    var month = (_randomInt(12) + 1).toString();
    if (month.length < 2) {
      month = '0$month';
    }

    var day = (_randomInt(28) + 1).toString();
    if (day.length < 2) {
      day = '0$day';
    }

    final rating = _randomInt(4) + _rand.nextDouble() + 1;

    final firstName =
        _randomString(_randomInt(4) + 6, noSpace: true).capitalize;
    final middleName =
        _randomString(_randomInt(4) + 6, noSpace: true).capitalize;
    final lastName = _randomString(_randomInt(8) + 6, noSpace: true).capitalize;

    final lecturer = [lastName, firstName, middleName].join(' ');

    final author = User(
      id: _randomInt(pow(10, 6).toInt()),
      firstName: _randomString(_randomInt(4) + 6, noSpace: true).capitalize,
      lastName: _randomString(_randomInt(8) + 6, noSpace: true).capitalize,
      email: '${_randomString(_randomInt(4) + 6, noSpace: true)}@mail.ru',
      middleName: _randomInt(2) == 1
          ? _randomString(_randomInt(6) + 8, noSpace: true).capitalize
          : null,
      avatar: _randomInt(2) == 1
          ? _randomString(_randomInt(20) + 10, noSpace: true, useEn: true)
          : null,
    );

    return Lecture(
      id: id,
      institution: institution,
      subject: subject,
      topic: topic,
      content: Content(
        text: text,
        photos: photos,
        videos: videos,
        audios: audios,
      ),
      lecturer: lecturer,
      date: '$day.$month.$year',
      rating: isPublished ? rating : 0,
      author: author,
    );
  }
}
