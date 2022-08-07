import 'package:common/common.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local_db/local_db.dart';

void main() {
  group('LectureDao tests', () {
    final db = LocalDB('test');
    final dao = LectureDao('notes', db);

    const lectureId = 100;
    final lecture = Lecture(
      id: lectureId,
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

    test('insert', () async {
      expect(await dao.insert(lecture), isPositive);
    });

    test('clear', () async {
      await dao.insert(lecture);
      expect(await dao.clear(), isPositive);
    });

    test('get', () async {
      await dao.clear();
      await dao.insert(lecture);
      expect(await dao.get(lectureId), lecture);
    });

    test('update', () async {
      await dao.clear();
      await dao.insert(lecture);
      final updated = lecture.copyWith(topic: 'newTopic');
      expect(await dao.update(updated), 1);
    });

    test('update not existing object', () async {
      await dao.clear();
      expect(await dao.update(lecture), 0);
    });

    test('getAll', () async {
      await dao.insert(lecture);
      expect(await dao.getAll(), isNotEmpty);
    });

    test('put object that does NOT exist', () async {
      await dao.clear();
      expect(await dao.put(lecture), 1);
    });

    test('put object that DOES exist', () async {
      await dao.clear();
      await dao.insert(lecture);
      expect(await dao.put(lecture), 1);
    });
  });
}
