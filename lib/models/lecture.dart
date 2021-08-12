import 'dart:math';

import '../global_parameters.dart';

class Lecture {
  Lecture({
    required this.faculty,
    required this.level,
    required this.subject,
    required this.semester,
    required this.topic,
    required this.content,
    required this.lecturer,
    required this.date,
    required this.rating,
    required this.author,
  });

  late String faculty;
  late String level;
  late String subject;
  late int semester;
  late String topic;
  dynamic content;
  late String lecturer;
  late String date;
  late double rating;
  late String author;

  Lecture.random({bool isPublished = true}) {
    var rand = Random();
    const _chars = 'йцукенгшщзхъфывапролджэячсмитьбю ';
    String getRandomString(int length) =>
        String.fromCharCodes(Iterable.generate(
            length, (_) => _chars.codeUnitAt(rand.nextInt(_chars.length))));
    String _faculty = GlobalParameters
        .faculties[rand.nextInt(GlobalParameters.faculties.length)];
    String _level =
        GlobalParameters.levels[rand.nextInt(GlobalParameters.levels.length)];
    String _subject = GlobalParameters
        .subjects[rand.nextInt(GlobalParameters.subjects.length)];
    int _semester = rand.nextInt(GlobalParameters.semesters) + 1;
    String _topic = getRandomString(rand.nextInt(10) + 10);
    String _content = getRandomString(rand.nextInt(50) + 50);
    String _lecturer =
        '${getRandomString(rand.nextInt(7) + 7)} ${getRandomString(1)}.${getRandomString(1)}';
    String _year = (rand.nextInt(5) + 2015).toString();
    String _month = (rand.nextInt(12) + 1).toString();
    if (_month.length < 2) {
      _month = '0' + _month;
    }
    String _day = (rand.nextInt(28) + 1).toString();
    if (_day.length < 2) {
      _day = '0' + _day;
    }
    double _rating = rand.nextInt(4) + rand.nextDouble() + 1;
    String _author =
        '${getRandomString(rand.nextInt(7) + 7)} ${getRandomString(1)}.${getRandomString(1)}';
    faculty = _faculty;
    level = _level;
    subject = _subject;
    semester = _semester;
    topic = _topic;
    content = _content;
    lecturer = _lecturer;
    date = '$_day.$_month.$_year';
    rating = isPublished ? _rating : 0;
    author = _author;
  }

  Lecture.fromMap(Map<String, dynamic> map) {
    List<String> keys = fieldsEN;
    faculty = map[keys[0]];
    level = map[keys[1]];
    subject = map[keys[2]];
    semester = map[keys[3]];
    topic = map[keys[4]];
    content = map[keys[5]];
    lecturer = map[keys[6]];
    date = map[keys[7]].split('.').reversed.join('.');
    rating = map[keys[8]];
    author = map[keys[9]];
  }

  Map<String, dynamic> toMap() {
    List<String> parts = date.split('.');
    for (int i = 0; i < 2; i++) {
      if (parts[i].length < 2) {
        parts[i] = '0' + parts[i];
      }
    }
    String formatted = parts.reversed.join('.');
    return {
      'faculty': faculty,
      'level': level,
      'subject': subject,
      'semester': semester,
      'topic': topic,
      'content': {
        'text': content as String,
        'photos': [],
        'videos': [],
      },
      'lecturer': lecturer,
      'date': formatted,
      'rating': rating,
      'author': author,
    };
  }

  List<String> get fieldsEN => [
        'faculty',
        'level',
        'subject',
        'semester',
        'topic',
        'content',
        'lecturer',
        'date',
        'rating',
        'author',
      ];

  List<String> get fieldsRU => [
        'Факультет',
        'Уровень высшего образования',
        'Предмет',
        'Семестер',
        'Тема',
        'Контент',
        'Лектор',
        'Дата',
        'Рейтинг',
        'Автор',
      ];

  List<dynamic> get items => [
        faculty,
        level,
        subject,
        semester,
        topic,
        content,
        lecturer,
        date,
        rating,
        author,
      ];
}
