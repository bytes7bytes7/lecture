import 'dart:typed_data';

import 'package:rest_client/rest_client.dart';

import '../interface/lecture_repo.dart';

class LectureRepoImpl implements LectureRepo {
  @override
  Future<void> addBookmark(int id) {
    // TODO: implement addBookmark
    throw UnimplementedError();
  }

  @override
  Future<void> addLecture(Lecture lecture) {
    // TODO: implement addLecture
    throw UnimplementedError();
  }

  @override
  Future<void> deleteBookmark(int id) {
    // TODO: implement deleteBookmark
    throw UnimplementedError();
  }

  @override
  Future<void> deleteLecture(int id) {
    // TODO: implement deleteLecture
    throw UnimplementedError();
  }

  @override
  Future<List<Uint8List>> getAudios(List<int> ids) {
    // TODO: implement getAudios
    throw UnimplementedError();
  }

  @override
  Future<Content?> getContent(int id) {
    // TODO: implement getContent
    throw UnimplementedError();
  }

  @override
  Future<List<Lecture>> getLectures(int? id) {
    // TODO: implement getLectures
    throw UnimplementedError();
  }

  @override
  Future<List<Uint8List>> getPhotos(List<int> ids) {
    // TODO: implement getPhotos
    throw UnimplementedError();
  }

  @override
  Future<List<Lecture>> getUserLectures(int id) {
    // TODO: implement getUserLectures
    throw UnimplementedError();
  }

  @override
  Future<List<Uint8List>> getVideos(List<int> ids) {
    // TODO: implement getVideos
    throw UnimplementedError();
  }
}
