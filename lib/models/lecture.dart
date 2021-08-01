class Lecture {
  Lecture({
    required this.subject,
    required this.topic,
    required this.content,
    required this.lecturer,
    required this.date,
    required this.rating,
    required this.author,
  });

  late String subject;
  late String topic;
  dynamic content;
  late String lecturer;
  late String date;
  late double rating;
  late String author;

  Lecture.fromMap(Map<String, dynamic> map) {
    List<String> keys = fieldsEN;
    subject = map[keys[0]];
    topic = map[keys[1]];
    content = map[keys[2]];
    lecturer = map[keys[3]];
    date = map[keys[4]];
    rating = map[keys[5]];
    author = map[keys[6]];
  }

  List<String> get fieldsEN => [
        'subject',
        'topic',
        'content',
        'lecturer',
        'date',
        'rating',
        'author',
      ];

  List<String> get fieldsRU => [
        'Предмет',
        'Тема',
        'Контент',
        'Лектор',
        'Дата',
        'Рейтинг',
        'Автор',
      ];

  List<dynamic> get items => [
        subject,
        topic,
        content,
        lecturer,
        date,
        rating,
        author,
      ];
}
