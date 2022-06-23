import 'dart:typed_data';

import 'package:rest_client/rest_client.dart';

abstract class LectureRepo {
  const LectureRepo();

  Future<void> addLecture(Lecture lecture);

  Future<void> deleteLecture(int id);

  Future<List<Lecture>> getLectures(int? id);

  Future<Content?> getContent(int id);

  Future<List<Uint8List>> getPhotos(List<int> ids);

  Future<List<Uint8List>> getVideos(List<int> ids);

  Future<List<Uint8List>> getAudios(List<int> ids);

  Future<void> addBookmark(int id);

  Future<void> deleteBookmark(int id);

  Future<List<Lecture>> getUserLectures(int id);
}
