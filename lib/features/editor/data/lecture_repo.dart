import 'package:rest_client/rest_client.dart';
import 'package:rxdart/rxdart.dart';

abstract class LectureRepo {
  const LectureRepo();

  ValueStream<Lecture> get draft;

  void dispose();

  Future<void> saveDraft(Lecture draft);

  Future<void> loadDraft();
}
