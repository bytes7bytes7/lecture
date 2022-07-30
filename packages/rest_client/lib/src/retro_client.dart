import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../rest_client.dart';
import 'constants/api.dart' as const_api;
import 'constants/secret.dart' as const_secret;

part 'retro_client.g.dart';

@RestApi(baseUrl: const_secret.baseUrl)
abstract class RetroClient implements RestClient {
  factory RetroClient(Dio dio, {String baseUrl}) = _RetroClient;

  @override
  @POST(const_secret.signUp)
  Future<Map<String, String>> signUp({
    @Query(const_api.login) required String login,
    @Query(const_api.password) required String password,
  });

  @override
  @POST(const_secret.verifyCode)
  Future<Map<String, bool>> verifyCode(
    @Query(const_api.code) String code,
  );

  @override
  @POST(const_secret.setPersonalInfo)
  Future<Map<String, String?>> setPersonalInfo({
    @Query(const_api.firstName) required String firstName,
    @Query(const_api.lastName) required String lastName,
    @Query(const_api.middleName) required String? middleName,
  });

  @override
  @POST(const_secret.signIn)
  Future<String> signIn({
    @Query(const_api.login) required String login,
    @Query(const_api.password) required String password,
  });

  @override
  @POST(const_secret.recoverPasswd)
  Future<void> recoverPasswd(
    @Query(const_api.login) String login,
  );

  @override
  @POST(const_secret.setNewPasswd)
  Future<void> setNewPasswd(
    @Query(const_api.password) String password,
  );

  @override
  @POST(const_secret.logOut)
  Future<void> logOut();

  @override
  @POST(const_secret.addLecture)
  Future<int> addLecture(@Body() Lecture lecture);

  @override
  @DELETE(const_secret.deleteLecture)
  Future<void> deleteLecture(
    @Path(const_api.id) int id,
  );

  @override
  @GET(const_secret.getLectures)
  Future<List<Lecture>> getLectures(
    @Path(const_api.id) int? id,
    Map<String, dynamic> filter,
  );

  @override
  @GET(const_secret.getContent)
  Future<Content?> getContent(
    @Path(const_api.id) int id,
  );

  @override
  @GET(const_secret.getPhotos)
  Future<List<int>> getPhoto(
    @Path(const_api.id) int id,
  );

  @override
  @GET(const_secret.getVideos)
  Future<List<int>> getVideo(
    @Path(const_api.id) int id,
  );

  @override
  @GET(const_secret.getAudios)
  Future<List<int>> getAudio(
    @Path(const_api.id) int id,
  );

  @override
  @POST(const_secret.addBookmark)
  Future<void> addBookmark(int id);

  @override
  @POST(const_secret.deleteBookmark)
  Future<void> deleteBookmark(int id);

  @override
  @GET(const_secret.getUserLectures)
  Future<List<Lecture>> getUserLectures(int id);

  @override
  @POST(const_secret.getToken)
  Future<Map<String, String>> getToken({
    @Query(const_api.login) required String login,
    @Query(const_api.password) required String password,
  });

  @override
  @POST(const_secret.refreshToken)
  Future<String> refreshToken(
    @Query(const_api.token) String token,
  );

  @override
  @POST(const_secret.deleteUser)
  Future<void> deleteUser();

  @override
  @POST(const_secret.changeUserInfo)
  Future<void> changeUserInfo(Map<String, dynamic> params);

  @override
  @GET(const_secret.getMe)
  Future<User> getMe();

  @override
  @GET(const_secret.getUser)
  Future<User> getUser(int id);

  @override
  @GET(const_secret.findInstitution)
  Future<List<String>> findInstitution(String query);

  @override
  @GET(const_secret.findSubject)
  Future<List<String>> findSubject(String query);

  @override
  @GET(const_secret.findAuthor)
  Future<List<User>> findAuthor(String query);
}
