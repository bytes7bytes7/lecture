import '../rest_client.dart';

abstract class RestClient {
  Future<String> signUp(String email, String password);

  Future<bool> confirmCode(String code);

  Future<void> setPersonalInfo(User user);

  Future<String> singIn(String email, String password);

  Future<void> recoverPasswd(String email);

  Future<void> setNewPasswd(String password);

  Future<void> logOut();

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

  Future<String> refreshToken(String token);

  Future<void> deleteUser();

  Future<void> changeUserInfo(Map<String, dynamic> params);

  Future<User> getUser(int id);

  Future<List<String>> findInstitution(String query);

  Future<List<String>> findSubject(String query);

  Future<List<User>> findAuthor(String query);
}
