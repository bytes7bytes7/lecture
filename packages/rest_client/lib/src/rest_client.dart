import '../rest_client.dart';

abstract class RestClient {
  /*
  ERROR:
  {
    "phone": [
      "The phone number entered is not valid."
    ],
    "password": [
      "This password is too short. It must contain at least 8 characters."
    ]
  }

  SUCCESS:
  {
    "phone": "+79526549873",
    "first_name": "string",
    "last_name": "string"
  }
 */
  Future<Map<String, String>> signUp({
    required String login,
    required String password,
  });

  Future<Map<String, bool>> verifyCode(String code);

  Future<Map<String, String?>> setPersonalInfo({
    required String firstName,
    required String lastName,
    required String? middleName,
  });

  Future<String> signIn({required String login, required String password});

  Future<void> recoverPasswd(String login);

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

  /*
  ERROR:
  {
    "detail": "No active account found with the given credentials"
  }

  SUCCESS:
  {
    "token": "SOME_TOKEN"
  }
   */
  Future<Map<String, String>> getToken({
    required String login,
    required String password,
  });

  Future<String> refreshToken(String token);

  Future<void> deleteUser();

  Future<void> changeUserInfo(Map<String, dynamic> params);

  Future<User> getMe();

  Future<User> getUser(int id);

  Future<List<String>> findInstitution(String query);

  Future<List<String>> findSubject(String query);

  Future<List<User>> findAuthor(String query);
}
