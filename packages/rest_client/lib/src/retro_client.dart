import 'dart:typed_data';

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
  Future<List<Uint8List>> getPhotos(@Path('id') List<int> ids);

  @override
  @GET(const_secret.getVideos)
  Future<List<Uint8List>> getVideos(@Path('id') List<int> ids);

  @override
  @GET(const_secret.getAudios)
  Future<List<Uint8List>> getAudios(@Path('id') List<int> ids);

  @override
  Future<void> addBookmark(int id);

  @override
  Future<void> deleteBookmark(int id);

  @override
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
  Future<void> deleteUser();

  @override
  Future<void> changeUserInfo(Map<String, dynamic> params);

  @override
  Future<User> getUser(int id);
}
