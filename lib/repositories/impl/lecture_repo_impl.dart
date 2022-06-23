import 'dart:typed_data';

import 'package:rest_client/rest_client.dart';
import 'package:riverpod/riverpod.dart';

import '../../scope/app_scope.dart';
import '../interface/lecture_repo.dart';

class LectureRepoImpl implements LectureRepo {
  const LectureRepoImpl(this._ref);

  final ProviderRef _ref;

  RestClient get _restClient => _ref.read(AppScope.get().restClient);

  @override
  Future<void> addLecture(Lecture lecture) async {
    final id = _restClient.addLecture(lecture);
    _ref
        .read(AppScope.get().loggerManager)
        .log('upload media-files for id = $id');
  }

  @override
  Future<void> deleteLecture(int id) async {
    return _restClient.deleteLecture(id);
  }

  @override
  Future<List<Lecture>> getLectures(int? id) async {
    final config = _ref.read(AppScope.get().filter);
    return _restClient.getLectures(id, config.toJson());
  }

  @override
  Future<Content?> getContent(int id) async {
    return _restClient.getContent(id);
  }

  @override
  Future<List<Uint8List>> getPhotos(List<int> ids) async {
    final result = <Uint8List>[];
    for (final id in ids) {
      result.add(Uint8List.fromList(await _restClient.getPhoto(id)));
    }

    return result;
  }

  @override
  Future<List<Uint8List>> getVideos(List<int> ids) async {
    final result = <Uint8List>[];
    for (final id in ids) {
      result.add(Uint8List.fromList(await _restClient.getVideo(id)));
    }

    return result;
  }

  @override
  Future<List<Uint8List>> getAudios(List<int> ids) async {
    final result = <Uint8List>[];
    for (final id in ids) {
      result.add(Uint8List.fromList(await _restClient.getAudio(id)));
    }

    return result;
  }

  @override
  Future<void> addBookmark(int id) async {
    return _restClient.addBookmark(id);
  }

  @override
  Future<void> deleteBookmark(int id) async {
    return _restClient.deleteBookmark(id);
  }

  @override
  Future<List<Lecture>> getUserLectures(int id) async {
    return _restClient.getUserLectures(id);
  }
}
