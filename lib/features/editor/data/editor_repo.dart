import 'package:common/common.dart';
import 'package:rxdart/rxdart.dart';

abstract class EditorRepo {
  const EditorRepo();

  ValueStream<Lecture> get lecture;

  ValueStream<Content> get content;

  void dispose();

  Future<void> saveDraft(Lecture lecture, Content content);

  Future<void> loadDraft(int id);

  Future<void> publish(Lecture lecture, Content content);
}
