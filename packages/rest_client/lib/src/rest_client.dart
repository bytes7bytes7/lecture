import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../rest_client.dart';
import 'constants/secret.dart' as const_secret;

part 'rest_client.g.dart';

@RestApi(baseUrl: const_secret.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET(const_secret.getLectures)
  Future<List<Lecture>> getLectures();

  @POST(const_secret.addLecture)
  Future<Lecture> createLecture(@Body() Lecture lecture);
}
