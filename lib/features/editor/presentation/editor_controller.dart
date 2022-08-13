import 'package:common/common.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/data.dart';

class EditorController extends StateNotifier<AsyncValue<void>> {
  EditorController({
    required EditorRepo editorRepo,
  })  : _editorRepo = editorRepo,
        super(
          const AsyncData(null),
        );

  final EditorRepo _editorRepo;

  Future<void> saveDraft(Lecture lecture, Content content) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _editorRepo.saveDraft(lecture, content),
    );
  }

  Future<void> loadDraft(int id) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _editorRepo.loadDraft(id),
    );
  }

  Future<void> publish(Lecture lecture, Content content) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _editorRepo.publish(lecture, content),
    );
  }
}
