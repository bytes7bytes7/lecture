import 'dart:math';

import '../constants/api.dart' as const_api;
import '../constants/text.dart' as const_text;
import '../global_parameters.dart';

const chars = 'йцукенгшщзхъфывапролджэячсмитьбю ';
final _rand = Random();

int _randomInt(int max) {
  if (max <= 0) {
    return -1;
  }

  return _rand.nextInt(max);
}

String _randomString(int length) => String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => chars.codeUnitAt(_randomInt(chars.length)),
      ),
    );

class Lecture {
  const Lecture({
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

  final String faculty;
  final String level;
  final String subject;
  final int semester;
  final String topic;
  final String text;
  final List<String> photos;
  final List<String> videos;
  final String lecturer;
  final String date;
  final double rating;
  final String author;

  // TODO: remove it
  static Lecture random({bool isPublished = true}) {
    var faculty = const_text.unknownStr;
    var index = _randomInt(GlobalParameters.faculties.length);
    if (index != -1 && GlobalParameters.faculties.isNotEmpty) {
      faculty = GlobalParameters.faculties[index];
    }

    var level = const_text.unknownStr;
    index = _randomInt(GlobalParameters.levels.length);
    if (index != -1 && GlobalParameters.levels.isNotEmpty) {
      level = GlobalParameters.levels[index];
    }

    var subject = const_text.unknownStr;
    index = _randomInt(GlobalParameters.subjects.length);
    if (index != -1 && GlobalParameters.subjects.isNotEmpty) {
      subject = GlobalParameters.subjects[index];
    }

    var semester = const_text.unknownInt;
    index = _randomInt(GlobalParameters.semesters);
    if (index != -1 && GlobalParameters.semesters > 0) {
      semester = index + 1;
    }

    final topic = _randomString(_randomInt(10) + 10);
    final text = _randomString(_randomInt(50) + 200);
    final photos = List<String>.generate(_randomInt(10), _randomString);
    final videos = List<String>.generate(_randomInt(10), _randomString);
    final lecturer =
        '${_randomString(_randomInt(7) + 7)} ${_randomString(1)}.${_randomString(1)}';
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
    final author =
        '${_randomString(_randomInt(7) + 7)} ${_randomString(1)}.${_randomString(1)}';

    return Lecture(
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
    final faculty = map[const_api.faculty];
    final level = map[const_api.level];
    final subject = map[const_api.subject];
    final semester = map[const_api.semester];
    final topic = map[const_api.topic];

    final content = map[const_api.content];
    var text = const_text.unknownStr;
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
      faculty: (faculty is String) ? faculty : const_text.unknownStr,
      level: (level is String) ? level : const_text.unknownStr,
      subject: (subject is String) ? subject : const_text.unknownStr,
      semester: (semester is int) ? semester : const_text.unknownInt,
      topic: (topic is String) ? topic : const_text.unknownStr,
      text: text,
      photos: photos,
      videos: videos,
      lecturer: (lecturer is String) ? lecturer : const_text.unknownStr,
      date: (date is String)
          ? date.split('.').reversed.join('.')
          : const_text.unknownStr,
      rating: (rating is double) ? rating : const_text.unknownDouble,
      author: (author is String) ? author : const_text.unknownStr,
    );
  }

  Map<String, Object?> toMap() {
    final fDate = date.split('.').reversed.join('.');
    return {
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
}
