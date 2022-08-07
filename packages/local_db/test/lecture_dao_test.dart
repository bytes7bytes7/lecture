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

    test('insert existing object', () async {
      await dao.clear();
      await dao.insert(lecture);
      expect(await dao.insert(lecture), null);
    });

    test('insert NOT existing object', () async {
      await dao.clear();
      expect(await dao.insert(lecture), lectureId);
    });

    test('delete existing object', () async {
      await dao.insert(lecture);
      expect(await dao.delete(lecture), isPositive);
    });

    test('delete NOT existing object', () async {
      await dao.clear();
      expect(await dao.delete(lecture), 0);
    });

    test('clear full store', () async {
      await dao.insert(lecture);
      expect(await dao.clear(), isPositive);
    });

    test('clear empty store', () async {
      await dao.clear();
      expect(await dao.clear(), 0);
    });

    test('get existing object', () async {
      await dao.clear();
      await dao.insert(lecture);
      expect(await dao.get(lectureId), lecture);
    });

    test('get not existing object', () async {
      await dao.clear();
      expect(await dao.get(lectureId), null);
    });

    test('update existing object', () async {
      await dao.clear();
      await dao.insert(lecture);
      final updated = lecture.copyWith(topic: 'newTopic');
      expect(await dao.update(updated), 1);
    });

    test('update not existing object', () async {
      await dao.clear();
      expect(await dao.update(lecture), 0);
    });

    test('getAll from full store', () async {
      await dao.insert(lecture);
      expect(await dao.getAll(), isNotEmpty);
    });

    test('getAll from empty store', () async {
      await dao.clear();
      expect(await dao.getAll(), isEmpty);
    });

    test('put existing object', () async {
      await dao.clear();
      await dao.insert(lecture);
      expect(await dao.put(lecture), lecture);
    });

    test('put NOT existing object', () async {
      await dao.clear();
      expect(await dao.put(lecture), lecture);
    });
  });
}
