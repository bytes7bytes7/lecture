import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../rest_client.dart';
import 'constants/secret.dart' as const_secret;

part 'retro_client.g.dart';

@RestApi(baseUrl: const_secret.baseUrl)
abstract class RetroClient implements RestClient {
  factory RetroClient(Dio dio, {String baseUrl}) = _RetroClient;

  @override
  @POST(const_secret.addLecture)
  Future<int> addLecture(@Body() Lecture lecture);

  @override
  @DELETE(const_secret.deleteLecture)
  Future<void> deleteLecture(@Path('id') int id);

  @override
  @GET(const_secret.getLectures)
  Future<List<Lecture>> getLectures(
    @Path('id') int? id,
    Map<String, dynamic> filter,
  );

  @override
  @GET(const_secret.getContent)
  Future<Content?> getContent(@Path('id') int id);

  @override
  @GET(const_secret.getPhotos)
  Future<List<int>> getPhoto(@Path('id') int id);

  @override
  @GET(const_secret.getVideos)
  Future<List<int>> getVideo(@Path('id') int id);

  @override
  @GET(const_secret.getAudios)
  Future<List<int>> getAudio(@Path('id') int id);

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
  Future<String> getToken(
    @Query('username') String login,
    @Query('password') String password,
  );

  @override
  @POST(const_secret.refreshToken)
  Future<String> refreshToken(@Query('token') String token);

  @override
  @POST(const_secret.deleteUser)
  Future<void> deleteUser();

  @override
  @POST(const_secret.changeUserInfo)
  Future<void> changeUserInfo(Map<String, dynamic> params);

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
