import 'package:common/common.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local_db/local_db.dart';

void main() {
  group('LectureDao tests', () {
    final db = LocalDB('test');
    final dao = LectureDao('notes', db);

    final lecture = Lecture(
      id: 100,
      author: const User(
        id: 101,
        firstName: 'first',
        lastName: 'last',
        email: 'email@mail.ru',
      ),
      topic: 'top',
      institution: 'inst',
      lecturer: 'lecturer',
      subject: 'subj',
      date: DateTime(2020, 1, 1).toString(),
      rating: 0,
    );

    test('clear', () async {
      expect(await dao.clear(), isNonNegative);
    });

    test('insert', () async {
      expect(await dao.insert(lecture), isPositive);
    });

    test('update', () async {
      final updated = lecture.copyWith(topic: 'newTopic');
      expect(await dao.update(updated), 1);
    });

    test('update not existing object', () async {
      final updated = lecture.copyWith(id: 1);
      expect(await dao.update(updated), 0);
    });

    test('getAll', () async {
      expect(await dao.getAll(), isNotEmpty);
    });
  });
}
