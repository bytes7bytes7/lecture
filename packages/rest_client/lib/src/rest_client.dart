import 'dart:typed_data';

import '../rest_client.dart';

abstract class RestClient {
  Future<int> addLecture(Lecture lecture);

  Future<void> deleteLecture(int id);

  Future<List<Lecture>> getLectures(int? id, Map<String, dynamic> filter);

  Future<Content?> getContent(int id);

  Future<List<Uint8List>> getPhotos(List<int> ids);

  Future<List<Uint8List>> getVideos(List<int> ids);

  Future<List<Uint8List>> getAudios(List<int> ids);

  Future<void> addBookmark(int id);

  Future<void> deleteBookmark(int id);

  Future<List<Lecture>> getUserLectures(int id);

  Future<String> getToken(String login, String password);

  Future<String> refreshToken(String token);

  Future<void> deleteUser();

  Future<void> changeUserInfo(Map<String, dynamic> params);

  Future<User> getUser(int id);
}
