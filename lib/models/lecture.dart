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

  String subject;
  String topic;
  dynamic content;
  String lecturer;
  String date;
  double rating;
  String author;

  List<String> get fields {
    return [
      'Предмет',
      'Тема',
      'Контент',
      'Лектор',
      'Дата',
      'Рейтинг',
      'Автор',
    ];
  }

  List<dynamic> get items {
    return [
      subject,
      topic,
      content,
      lecturer,
      date,
      rating,
      author,
    ];
  }
}
