import 'dart:math';

import '../constants/api.dart' as const_api;
import '../constants/app.dart' as const_app;
import '../custom/string_ext.dart';
import '../global_parameters.dart';
import 'user.dart';

const _ru = 'йцукенгшщзхъфывапролджэячсмитьбю ';
const _en = 'qwertyuiopasdfghjklzxcvbnm ';
const _num = '0123456789';
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

String _randomID() {
  return String.fromCharCodes(
    Iterable.generate(
      8,
      (_) => _num.codeUnitAt(_randomInt(_num.length)),
    ),
  );
}

enum Rating {
  excellent,
  good,
  bad,
  unknown,
}

class Lecture {
  const Lecture({
    required this.id,
    required this.faculty,
    required this.level,
    required this.subject,
    required this.semester,
    required this.topic,
    required this.text,
    required this.photos,
    required this.videos,
    required this.lecturer,
    required this.date,
    required this.rating,
    required this.author,
  });

  final String id;
  final String faculty;
  final String level;
  final String subject;
  final int semester;
  final String topic;
  final String text;
  final List<String> photos;
  final List<String> videos;
  final User lecturer;
  final String date;
  final double rating;
  final User author;

  // TODO: remove it
  static Lecture random({bool isPublished = true}) {
    final id = _randomID();

    var faculty = const_app.unknownStr;
    var index = _randomInt(GlobalParameters.faculties.length);
    if (index != -1 && GlobalParameters.faculties.isNotEmpty) {
      faculty = GlobalParameters.faculties[index];
    }

    var level = const_app.unknownStr;
    index = _randomInt(GlobalParameters.levels.length);
    if (index != -1 && GlobalParameters.levels.isNotEmpty) {
      level = GlobalParameters.levels[index];
    }

    var subject = const_app.unknownStr;
    index = _randomInt(GlobalParameters.subjects.length);
    if (index != -1 && GlobalParameters.subjects.isNotEmpty) {
      subject = GlobalParameters.subjects[index];
    }

    var semester = const_app.unknownInt;
    index = _randomInt(GlobalParameters.semesters);
    if (index != -1 && GlobalParameters.semesters > 0) {
      semester = index + 1;
    }

    final topic = _randomString(_randomInt(10) + 10).capitalized;
    final text = _randomString(_randomInt(300) + 5000);
    final photos = List<String>.generate(
      _randomInt(10),
      (i) => _randomString(i, noSpace: true, useEn: true),
    );
    final videos = List<String>.generate(
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

    final lecturer = User(
      id: _randomID(),
      firstName: _randomString(_randomInt(4) + 6, noSpace: true).capitalized,
      middleName: _randomInt(2) == 1
          ? _randomString(_randomInt(6) + 8, noSpace: true).capitalized
          : null,
      lastName: _randomString(_randomInt(8) + 6, noSpace: true).capitalized,
      avatar: _randomInt(2) == 1
          ? _randomInt(2) == 1
              ? 'https://images.ctfassets.net/hrltx12pl8hq/qGOnNvgfJIe2MytFdIcTQ/429dd7e2cb176f93bf9b21a8f89edc77/Images.jpg'
              : _randomString(_randomInt(20) + 10, noSpace: true, useEn: true)
          : null,
    );

    final author = User(
      id: _randomID(),
      firstName: _randomString(_randomInt(4) + 6, noSpace: true).capitalized,
      middleName: _randomInt(2) == 1
          ? _randomString(_randomInt(6) + 8, noSpace: true).capitalized
          : null,
      lastName: _randomString(_randomInt(8) + 6, noSpace: true).capitalized,
      avatar: _randomInt(2) == 1
          ? _randomString(_randomInt(20) + 10, noSpace: true, useEn: true)
          : null,
    );

    return Lecture(
      id: id,
      faculty: faculty,
      level: level,
      subject: subject,
      semester: semester,
      topic: topic,
      text: text,
      photos: photos,
      videos: videos,
      lecturer: lecturer,
      date: '$day.$month.$year',
      rating: isPublished ? rating : 0,
      author: author,
    );
  }

  static Lecture fromMap(Map<String, Object?> map) {
    final id = map[const_api.id];
    final faculty = map[const_api.faculty];
    final level = map[const_api.level];
    final subject = map[const_api.subject];
    final semester = map[const_api.semester];
    final topic = map[const_api.topic];

    final content = map[const_api.content];
    var text = const_app.unknownStr;
    var photos = <String>[];
    var videos = <String>[];
    if (content is Map<String, Object?>) {
      final tText = content[const_api.text];
      if (tText is String) {
        text = tText;
      }

      final tPhotos = content[const_api.photos];
      if (tPhotos is List<String>) {
        photos = tPhotos;
      }

      final tVideos = content[const_api.videos];
      if (tVideos is List<String>) {
        videos = tVideos;
      }
    }

    final lecturer = map[const_api.lecturer];
    final date = map[const_api.date];
    final rating = map[const_api.rating];
    final author = map[const_api.author];

    return Lecture(
      id: (id is String) ? id : const_app.unknownStr,
      faculty: (faculty is String) ? faculty : const_app.unknownStr,
      level: (level is String) ? level : const_app.unknownStr,
      subject: (subject is String) ? subject : const_app.unknownStr,
      semester: (semester is int) ? semester : const_app.unknownInt,
      topic: (topic is String) ? topic : const_app.unknownStr,
      text: text,
      photos: photos,
      videos: videos,
      lecturer: (lecturer is Map<String, Object?>)
          ? User.fromMap(lecturer)
          : User.fromMap(<String, Object?>{}),
      date: (date is String)
          ? date.split('.').reversed.join('.')
          : const_app.unknownStr,
      rating: (rating is double) ? rating : const_app.unknownDouble,
      author: (author is Map<String, Object?>)
          ? User.fromMap(author)
          : User.fromMap(<String, Object?>{}),
    );
  }

  Map<String, Object?> toMap() {
    final fDate = date.split('.').reversed.join('.');
    return {
      const_api.id: id,
      const_api.faculty: faculty,
      const_api.level: level,
      const_api.subject: subject,
      const_api.semester: semester,
      const_api.topic: topic,
      const_api.content: {
        const_api.text: text,
        const_api.photos: photos,
        const_api.videos: videos,
      },
      const_api.lecturer: lecturer,
      const_api.date: fDate,
      const_api.rating: rating,
      const_api.author: author,
    };
  }

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
