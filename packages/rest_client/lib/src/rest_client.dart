import '../rest_client.dart';

abstract class RestClient {
  Future<int> addLecture(Lecture lecture);

  Future<void> deleteLecture(int id);

  Future<List<Lecture>> getLectures(int? id, Map<String, dynamic> filter);

  Future<Content?> getContent(int id);

  Future<List<int>> getPhoto(int id);

  Future<List<int>> getVideo(int id);

  Future<List<int>> getAudio(int id);

  Future<void> addBookmark(int id);

  Future<void> deleteBookmark(int id);

  Future<List<Lecture>> getUserLectures(int id);

  Future<String> getToken(String login, String password);

  Future<String> refreshToken(String token);

  Future<void> deleteUser();

  Future<void> changeUserInfo(Map<String, dynamic> params);

  Future<User> getUser(int id);
}
