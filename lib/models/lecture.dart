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
    const charsR = 'йцукенгшщзхъфывапролджэячсмитьбю ';
    String getRandomString(int length) =>
        String.fromCharCodes(Iterable.generate(
            length, (_) => charsR.codeUnitAt(rand.nextInt(charsR.length))));
    String facultyR = GlobalParameters
        .faculties[rand.nextInt(GlobalParameters.faculties.length)];
    String levelR =
        GlobalParameters.levels[rand.nextInt(GlobalParameters.levels.length)];
    String subjectR = GlobalParameters
        .subjects[rand.nextInt(GlobalParameters.subjects.length)];
    int semesterR = rand.nextInt(GlobalParameters.semesters) + 1;
    String topicR = getRandomString(rand.nextInt(10) + 10);
    String contentR = getRandomString(rand.nextInt(50) + 50);
    String lecturerR =
        '${getRandomString(rand.nextInt(7) + 7)} ${getRandomString(1)}.${getRandomString(1)}';
    String yearR = (rand.nextInt(5) + 2015).toString();
    String monthR = (rand.nextInt(12) + 1).toString();
    if (monthR.length < 2) {
      monthR = '0$monthR';
    }
    String dayR = (rand.nextInt(28) + 1).toString();
    if (dayR.length < 2) {
      dayR = '0$dayR';
    }
    double ratingR = rand.nextInt(4) + rand.nextDouble() + 1;
    String authorR =
        '${getRandomString(rand.nextInt(7) + 7)} ${getRandomString(1)}.${getRandomString(1)}';

    faculty = facultyR;
    level = levelR;
    subject = subjectR;
    semester = semesterR;
    topic = topicR;
    content = contentR;
    lecturer = lecturerR;
    date = '$dayR.$monthR.$yearR';
    rating = isPublished ? ratingR : 0;
    author = authorR;
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
        parts[i] = '0${parts[i]}';
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
